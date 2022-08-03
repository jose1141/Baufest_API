Feature: Eliminar Mascotas

  Background: Variables que seran comunes entre los escenarios
    * url 'https://petstore.swagger.io/v2/'

  @AP
  Scenario: Eliminar una mascota existente
    Given path 'pet/1235'
    When method delete
    Then status 200

  @AP
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
    * print "El valor del petid es:" + " " + petId

    And path 'pet/', petId
    When method delete
    Then status 200




