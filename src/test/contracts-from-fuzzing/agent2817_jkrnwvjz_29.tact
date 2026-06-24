struct A {
  i: Int?;
  b: Bool?;
  s: String?;
}

struct B {
  a: A;
  s: String;
}

contract OptionalWithInner {
  f: B;

  init() {
    self.f = B{ a: A{ i:null, b:null, s:null }, s:"s" };
  }
}
