struct Sub {
  a: Int;
  b: Bool?;
  c: String;
}

contract MixedPersists {
  intVal: Int;
  boolVal: Bool;
  stringVal: String;
  sliceVal: Slice;
  subStruct: Sub;

  init() {
    self.intVal = 15;
    self.boolVal = true;
    self.stringVal = "hm";
    self.sliceVal = emptyCell().asSlice();
    self.subStruct = Sub{
      a: 1,
      b: null,
      c: "yo"
    };
  }
}