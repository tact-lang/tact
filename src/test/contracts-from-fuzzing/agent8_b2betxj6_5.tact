struct BoolInt {
  b: Bool;
  i: Int;
}

contract MultipleFieldsOrderTest {
  f1: Bool;
  f2: Int;
  f3: BoolInt;
  f4: Int?;

  init() {
    self.f1 = true;
    self.f2 = 123;
    self.f3 = BoolInt{b: false, i: 456};
    self.f4 = null;
  }
}