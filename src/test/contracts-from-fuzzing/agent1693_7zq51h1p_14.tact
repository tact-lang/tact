struct Complex {
  a: Int?;
  b: Bool?;
  c: String?;
}

contract OptionalStructVars {
  field1: Complex;
  field2: Complex;

  init() {
    self.field1 = Complex{ a:null, b:true, c:null };
    self.field2 = Complex{ a:777, b:null, c:"hello" };
  }
}