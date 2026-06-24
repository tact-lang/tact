struct OptS { x: Int?; y: Bool?; }

contract ManyOptionals {
  a: Int?;
  b: Bool?;
  c: String?;
  nested: OptS;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
    self.nested = OptS{ x: null, y: null };
  }
}