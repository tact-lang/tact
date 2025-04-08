struct BigStruct {
  x1: Int;
  x2: Bool;
  x3: Int;
  x4: Bool;
  x5: Int;
  x6: Bool;
  x7: Int;
  x8: Bool;
  x9: Int;
  x10: Bool;
}

contract MultiField {
  val: BigStruct;

  init() {
    self.val = BigStruct{
      x1: 1,
      x2: true,
      x3: 2,
      x4: false,
      x5: 3,
      x6: true,
      x7: 4,
      x8: false,
      x9: 5,
      x10: true,
    };
  }
}