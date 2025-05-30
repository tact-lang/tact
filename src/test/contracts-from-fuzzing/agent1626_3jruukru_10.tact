struct MixedTypes {
  int1: Int;
  bool1: Bool;
  str1: String;
  optInt: Int?;
  optBool: Bool?;
  optStr: String?;
}

contract TestStorage {
  data: MixedTypes;

  init() {
    self.data = MixedTypes{
      int1: 1, bool1: true, str1: "x",
      optInt: null, optBool: false, optStr: null
    };
  }
}