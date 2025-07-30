struct Complex {
  intField: Int;
  boolField: Bool;
  stringField: String;
  optInt: Int?;
  optBool: Bool?;
  optString: String?;
}

contract NestedManyTypes {
  f: Complex;

  init() {
    self.f = Complex {
      intField: 7,
      boolField: true,
      stringField: "hi",
      optInt: null,
      optBool: null,
      optString: null,
    };
  }
}
