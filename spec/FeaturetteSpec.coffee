describe "Featurette", ->
  it "registers featurettes", ->
    expect(Featurette.registered_features["exclamation"]).toBeDefined()

  it "executes features when load is run", ->
    Featurette.load()
    element = document.getElementsByTagName("h1")[0]
    expect(element.innerHTML).toEqual("Exclamation!")

  it "executes multiple features when load is run", ->
    Featurette.load()
    element = document.getElementsByTagName("h2")[0]
    expect(element.innerHTML).toEqual("Wondered!?")

  it "gives ids to featurettes without them", ->
    element = document.getElementsByTagName("h1")[0]
    expect(element.id.indexOf("featurette-")).toEqual(0)

  it "doesn't give ids to features with them", ->
    element = document.getElementById("so-awesome")
    expect(element.innerHTML).toEqual("So awesome!")

  describe "calling load subsequent times", ->
    it "ignores featurettes that have already loaded", ->
      list = document.getElementById("exclamatory-list")
      list.innerHTML = """
        <li id="so-cool" data-featurette="exclamation">So cool</li>
      """

      Featurette.load()

      element = document.getElementsByTagName("h1")[0]
      expect(element.innerHTML).toEqual("Exclamation!")

    it "loads unloaded featurettes", ->
      element = document.getElementById("so-cool")
      expect(element.innerHTML).toEqual("So cool!")

  describe "calling Featurette.load inside a featurette's constructor", ->
    it "doesn't make the world implode", ->
      expect(Featurette.get('boom')).toBeDefined()

  describe "Retrieving a featurette", ->
    it "retrieves with id and params", ->
      expect(Featurette.get('multiple', {index: 1})).toBeDefined()

    it "retrieves with id and invalid params", ->
      expect(Featurette.get('multiple', {index: 2})).toBeUndefined()
