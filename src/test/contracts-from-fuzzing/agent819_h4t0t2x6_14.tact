struct Combo {
  int8: Int as int8;
  uint10: Int as uint10;
  bigInt: Int;
  flag1: Bool;
  flag2: Bool?;
  text: String;
  maybeText: String?;
}

contract TestContract {
  data: Combo;

  init() {
    self.data = Combo{
      int8: -50,
      uint10: 512,
      bigInt: 99999999999,
      flag1: true,
      flag2: null,
      text: "Data blob",
      maybeText: null
    };
  }
}