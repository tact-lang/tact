struct Data {
  x: Int;
  y: Int;
  z: Int;
  b1: Bool;
  b2: Bool;
  str1: String;
  str2: String;
}

contract Test {
  field1: Int;
  field2: Int?;
  field3: Bool;
  field4: Bool?;
  field5: String;
  field6: String?;
  nested: Data;

  init() {
    self.field1 = 1;
    self.field2 = null;
    self.field3 = true;
    self.field4 = null;
    self.field5 = "abc";
    self.field6 = null;
    self.nested = Data{
      x: 10,
      y: 20,
      z: 30,
      b1: true,
      b2: false,
      str1: "x",
      str2: "y",
    };
  }
}
