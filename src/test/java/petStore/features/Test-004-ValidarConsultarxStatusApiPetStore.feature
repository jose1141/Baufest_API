Feature: Buscar Mascotas por status

  Background: Variables que seran comunes entre los escenarios
    * url 'https://petstore.swagger.io/v2/'

  @HP @automatable
  Scenario: Buscar mascota por status "sold"
    * param status = 'sold'
    Given path 'pet/findByStatus'
    When method Get
    Then status 200




