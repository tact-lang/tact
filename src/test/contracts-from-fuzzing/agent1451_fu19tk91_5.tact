struct LargeStruct {
  a1: Int;
  b1: Bool;
  a2: Int;
  b2: Bool;
  a3: Int;
  b3: Bool;
  a4: Int;
  b4: Bool;
  a5: Int;
  b5: Bool;
  a6: Int;
  b6: Bool;
  a7: Int;
  b7: Bool;
  a8: Int;
}

contract ManyFieldsTest {
  big: LargeStruct = LargeStruct{
    a1: 1,
    b1: true,
    a2: 2,
    b2: false,
    a3: 3,
    b3: true,
    a4: 4,
    b4: false,
    a5: 5,
    b5: true,
    a6: 6,
    b6: false,
    a7: 7,
    b7: true,
    a8: 8,
  };

  receive() {
    self.big = self.big;
  }
}