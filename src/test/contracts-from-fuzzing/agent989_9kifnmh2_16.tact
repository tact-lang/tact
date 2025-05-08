struct Mix {
  opt: Int?;
  int: Int;
  bool: Bool;
  string: String;
  other: NestedMix;
}

struct NestedMix {
  innerBool: Bool;
  innerOpt: String?;
}

contract MixFields {
  data: Mix;

  init() {
    self.data = Mix{
      opt: null,
      int: 5,
      bool: true,
      string: "hi",
      other: NestedMix{ innerBool: false, innerOpt: null }
    };
  }
}