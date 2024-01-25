Description: Test demoing VIVIDUS capabilities for REST API

Scenario: Verify Luke's eyes are blue
When I execute HTTP GET request for resource with relative URL `/people/1/`
Then response code is equal to `200`
And JSON element from `${json-context}` by JSON path `$.eye_color` is equal to `blue`

Scenario: Verify Darth Vader's full body response
When I execute HTTP GET request for resource with relative URL `/people/4/`
Then response code is equal to `200`
And JSON element from `${json-context}` by JSON path `$` is equal to `
{
    "name": "Darth Vader",
    "height": "202",
    "mass": "136",
    "hair_color": "none",
    "skin_color": "white",
    "eye_color": "yellow",
    "birth_year": "41.9BBY",
    "gender": "male",
    "homeworld": "https://swapi.dev/api/planets/1/",
    "films": [
        "https://swapi.dev/api/films/1/",
        "https://swapi.dev/api/films/2/",
        "https://swapi.dev/api/films/3/",
        "https://swapi.dev/api/films/6/"
    ],
    "species": [],
    "vehicles": [],
    "starships": [
        "https://swapi.dev/api/starships/13/"
    ],
    "created": "2014-12-10T15:18:20.704000Z",
    "edited": "2014-12-20T21:17:50.313000Z",
    "url": "https://swapi.dev/api/people/4/"
}
`
