struct OptionalNested {
  optInt: Int?;
  optBool: Bool?;
  optString: String?;
}

struct WrapOptional {
  nested: OptionalNested?;
}

contract OptionalNestedTest {
  val: WrapOptional;

  init() {
    self.val = WrapOptional{
      nested: OptionalNested{
        optInt: 1,
        optBool: false,
        optString: "hi",
      },
    };
  }
}
