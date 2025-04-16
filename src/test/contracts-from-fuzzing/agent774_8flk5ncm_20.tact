struct Mix {
  intField: Int;
  stringOpt: String?;
  boolField: Bool;
  intOpt: Int?;
  boolOpt: Bool?;
  stringField: String;
}

contract MixedPersist {
  s: Mix;
  init() {
    self.s = Mix{
      intField: -7,
      stringOpt: null,
      boolField: true,
      intOpt: null,
      boolOpt: false,
      stringField: "yo"
    };
  }
}