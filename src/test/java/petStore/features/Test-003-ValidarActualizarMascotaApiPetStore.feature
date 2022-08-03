Feature: Actualizar datos de mascotas

  Background: defincion de variables comunes a los escenarios
    * url 'https://petstore.swagger.io/v2/'

  @AP
  Scenario: Actualizar estado sold a una mascota existente
    Given path 'pet'
    And request
    """
    {
      "id": "1235",
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
      "status": "sold"
      }
    """
    When method put
    Then status 200

