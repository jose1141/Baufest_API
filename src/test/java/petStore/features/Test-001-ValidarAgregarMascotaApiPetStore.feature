Feature: Agregar Mascotas

  Background: Variables que seran comunes entre los escenarios
    * url 'https://petstore.swagger.io/v2/'
    * def petRequest = read('classpath:petStore/request/petRequest.json')
    * def petResponse = read('classpath:petStore/response/petResponse.json')
    * def petResponseSchema = read('classpath:petStore/response/petResponseSchema.json')

  @HP 
  Scenario: Agregar una nueva mascota
    Given path 'pet'
    And request petRequest
    When method Post
    Then status 200

  @AP 
  Scenario: Agregar una nueva mascota y validar el schema de la respuesta
    Given path 'pet'
    And request petRequest
    When method Post
    Then status 200
    And match response == petResponseSchema

  @AP 
  Scenario Outline: Agregar una nueva mascota usando examples
    Given path 'pet'
    And request
    """
     {
        "id":<petId>,
        "category": {
          "id": 0,
          "name": "string"
        },
        "name": "<petName>",
        "photoUrls": [
          "string"
        ],
        "tags": [
          {
            "id": 0,
            "name": "string"
          }
        ],
        "status": "<status>"
      }
    """
    When method Post
    Then status 200

    Examples:
      | petId  | petName    | status    |
      | 1233   | Duque      | sold      |
      | 1234   | Princesa   | pending   |
      | 1235   | Rocky      | available |

  @AP 
  Scenario Outline: Agregar una nueva mascota usando data csv
    Given path 'pet'
    And request petRequest
    And request
    """
     {
        "id":<petId>,
        "category": {
          "id": 0,
          "name": "string"
        },
        "name": "<petName>",
        "photoUrls": [
          "string"
        ],
        "tags": [
          {
            "id": 0,
            "name": "string"
          }
        ],
        "status": "<status>"
      }
    """
    When method Post
    Then status 200

    Examples:
      | read('classpath:petStore/data/csv/data.csv') |

  @AP 
  Scenario: Agregar y listar las mascotas creadas
    And path 'pet'
    #And request petRequest
    And request
    """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "Duque",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
    """
    When method Post
    Then status 200
    * def petId = response.id

    And path 'pet/', petId
    When method get
    Then status 200

  Scenario: Agregar y eliminar una mascota
    Given path 'pet'
    #And request petRequest
    And request
    """
  {
    "id": 0,
    "category": {
      "id": 0,
      "name": "string"
    },
    "name": "Duque II",
    "photoUrls": [
      "string"
    ],
    "tags": [
      {
        "id": 0,
        "name": "string"
      }
    ],
    "status": "available"
  }
    """
    When method Post
    Then status 200
    * def petId = response.id
    * print "El valor del petid es:" + " " + petId

    And path 'pet/', petId
    When method delete
    Then status 200
