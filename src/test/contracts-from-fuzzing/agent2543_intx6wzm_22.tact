struct X {
  val: Int;
}

contract ManyFieldsContract {
  a: Int;
  b: String;
  c: Bool;
  d: X;
  e: Int;
  f: String;
  g: Bool;
  h: X;
  init() {
    self.a = 1;
    self.b = "hi";
    self.c = true;
    self.d = X{ val: 5 };
    self.e = 2;
    self.f = "bye";
    self.g = false;
    self.h = X{ val: 10 };
  }
}