struct A {
  v: Int;
}

contract FieldOrderTest {
  a: Int;
  b: Bool;
  c: Int?;
  d: A;
  e: String?;

  init() {
    self.a = 1;
    self.b = false;
    self.c = null;
    self.d = A{ v: 777 };
    self.e = "end";
  }
}