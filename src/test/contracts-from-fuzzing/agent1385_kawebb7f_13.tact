struct Nested { 
 x: Int; 
 y: String;
}

contract ArrangedFields {
  field1: Bool;
  field2: Int?;
  field3: String;
  field4: Int;
  field5: Nested;

  init() {
    self.field1 = true;
    self.field2 = null;
    self.field3 = "data";
    self.field4 = 100;
    self.field5 = Nested{ x:1, y:"hello" };
  }
}