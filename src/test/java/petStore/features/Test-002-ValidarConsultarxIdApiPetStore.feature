Feature: Buscar Mascotas por Id

  Background: Variables que seran comunes entre los escenarios
    * url 'https://petstore.swagger.io/v2/'

  @HP
  Scenario: Buscar mascota por Id
    Given path 'pet/1235'
    When method get
    Then status 200

  @HP
  Scenario: Agregar y buscar una mascota por Id
    Given path 'pet'
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
    When method get
    Then status 200


  @NP
  Scenario: Busqueda por Id de mascota que no existe
    Given path 'pet/9223372016900012951'
    When method get
    Then status 404



