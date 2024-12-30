local capititle = require("capititle")

describe("capititle.capitalize", function()
  it("should properly capitalize titles", function()
    assert.are.same(
      "The Quick Brown Fox Jumped Over the Lazy Dog",
      capititle.capitalize("the quick brown fox jumped over the lazy dog")
    )

    assert.are.same(
      "Harry Potter and the Deathly Hallows",
      capititle.capitalize("harry potter and the deathly hallows")
    )

    assert.are.same("The C Programming Language", capititle.capitalize("the c programming language"))
  end)

  it("should ignore anything other then letters", function()
    assert.are.same("My, Name Is Laith! 54321", capititle.capitalize("my, name Is laith! 54321"))
  end)
end)
