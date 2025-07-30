struct ComplexRemain {
  first: Int;
  nested: Slice as remaining;
}

contract LastRemainField {
  a: Int;
  b: Int as int8;
  c: ComplexRemain;

  init() {
    self.a = 1;
    self.b = 2;
    self.c = ComplexRemain{
      first: 999,
      nested: emptyCell().asSlice()
    };
  }
}