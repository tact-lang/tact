struct Simple {
  x: Int;
  y: Bool;
}

contract MultiFields {
  a: Int;
  b: Bool;
  c: Int?;
  d: Bool?;
  e: Simple;

  init() {
    self.a = 1;
    self.b = true;
    self.c = null;
    self.d = false;
    self.e = Simple{ x: 5, y: true };
  }
}