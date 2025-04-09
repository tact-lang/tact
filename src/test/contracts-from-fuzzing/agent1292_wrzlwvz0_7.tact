struct IntsBooleans {
  a: Int;
  b: Bool;
  c: Int;
  d: Bool;
  e: Int;
}

contract ManyFields {
  field1: Int;
  field2: Int;
  field3: Bool;
  field4: Bool;
  field5: Int;
  structField: IntsBooleans;

  init() {
    self.field1 = 1;
    self.field2 = 2;
    self.field3 = true;
    self.field4 = false;
    self.field5 = 5;
    self.structField = IntsBooleans{ a: 3, b: true, c: 4, d: false, e: 5 };
  }
}