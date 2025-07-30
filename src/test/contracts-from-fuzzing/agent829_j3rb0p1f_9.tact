struct Mixture {
  intField: Int;
  boolField: Bool;
  stringField: String;
  optionalInt: Int?;
  optionalBool: Bool?;
  optionalString: String?;
}

contract MixContract {
  persistent: Mixture;

  init() {
    self.persistent = Mixture{
      intField: 42,
      boolField: false,
      stringField: "hi",
      optionalInt: null,
      optionalBool: true,
      optionalString: null,
    };
  }
}