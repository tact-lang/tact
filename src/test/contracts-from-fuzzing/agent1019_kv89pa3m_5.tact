struct A {
  a1: Int;
  a2: Bool;
  a3: Int?;
  a4: String;
}

struct B {
  b1: Bool?;
  b2: String;
  b3: Int;
  b4: String?;
}

contract ManyTypes {
  x: A;
  y: B;

  init() {
    self.x = A{ a1: 1, a2: true, a3: null, a4: "foo" };
    self.y = B{ b1: null, b2: "bar", b3: 99, b4: null };
  }
}
