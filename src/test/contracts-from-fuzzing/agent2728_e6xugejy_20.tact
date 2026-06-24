struct LargeStruct {
  a1: Int;
  a2: Bool;
  a3: String;
  a4: Int;
  a5: Bool;
  a6: String;
  a7: Int;
  a8: Bool;
  a9: String;
  a10: Int;
}

contract Test {
  data: LargeStruct;

  init() {
    self.data = LargeStruct{
      a1: 1,
      a2: false,
      a3: "x",
      a4: 4,
      a5: true,
      a6: "y",
      a7: 7,
      a8: false,
      a9: "z",
      a10: 10
    };
  }
}