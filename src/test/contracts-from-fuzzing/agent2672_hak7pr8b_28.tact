struct SomeStruct {
   f1: Int;
   f2: Int as uint8;
   f3: Int as uint16;
   f4: Int as int32;
   f5: Int as uint64;
   f6: Int as coins;
   f7: Int?;
   f8: Bool?;
   f9: String;
   f10: String?;
}

contract VariousFields {
  storage: SomeStruct;

  init() {
    self.storage = SomeStruct {
      f1: 1,
      f2: 2,
      f3: 3,
      f4: 4,
      f5: 5,
      f6: 6,
      f7: null,
      f8: true,
      f9: "hi",
      f10:null
    };
  }
}
