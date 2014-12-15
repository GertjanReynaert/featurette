# Adds cool exclamation marks to whatever element it's on.
class Exclamation
  constructor: (element) ->
    element.innerHTML = element.innerHTML + "!"

Featurette.register("exclamation", Exclamation)

class Question
  constructor: (element) ->
    element.innerHTML = element.innerHTML + "?"

Featurette.register("question", Question)

class ExclamationGenerator
  constructor: (element) ->
    element.innerHTML = "<div data-featurette='exclamation'>Cool Beans</div>"
    Featurette.load()

Featurette.register('exclamation-generator', ExclamationGenerator)
