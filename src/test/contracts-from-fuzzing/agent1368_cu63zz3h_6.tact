struct Inner {
  x: Int;
  y: Int;
}

contract ArrayOfStructs {
  field0: Inner;
  field1: Inner;
  field2: Inner;
  field3: Inner;
  field4: Inner;

  init() {
    self.field0 = Inner{ x: 0, y: 0 };
    self.field1 = Inner{ x: 1, y: 1 };
    self.field2 = Inner{ x: 2, y: 2 };
    self.field3 = Inner{ x: 3, y: 3 };
    self.field4 = Inner{ x: 4, y: 4 };
  }
}
