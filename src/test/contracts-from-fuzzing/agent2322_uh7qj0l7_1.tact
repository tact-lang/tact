struct LargeStruct {
  f1: Int;
  f2: Int?;
  f3: String;
  f4: Bool;
  f5: Int;
  f6: String;
  f7: Bool;
  f8: Int?;
  f9: String;
  f10: Int;
}

contract BigFields {
  data: LargeStruct = LargeStruct{
    f1: 1,
    f2: null,
    f3: "a",
    f4: false,
    f5: 5,
    f6: "b",
    f7: true,
    f8: 8,
    f9: "c",
    f10: 10
  };

  init() {}
}
