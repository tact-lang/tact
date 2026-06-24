struct Complex {
  x: Int;
  y: Bool?;
  z: String;
}

contract ManyOptionals {
  a: Complex?;
  b: Complex?;
  c: Complex?;

  init() {
    self.a = null;
    self.b = null;
    self.c = null;
  }
}