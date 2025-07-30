struct LargeStruct {
  f1: Int;
  f2: Bool;
  f3: String;
  f4: Address;
  f5: Int?;
  f6: Bool?;
  f7: String?;
  f8: Address?;
  f9: Int;
  f10: Bool;
}

contract BigContract {
  storage: LargeStruct;

  init() {
    self.storage = LargeStruct{
      f1: 1,
      f2: true,
      f3: "hello",
      f4: myAddress(),
      f5: null,
      f6: null,
      f7: null,
      f8: null,
      f9: 9,
      f10: false,
    };
  }
}
