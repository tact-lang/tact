struct A { val: Int; }
struct B { val: Bool; }
struct C { val: String; }

contract ManyEmbedded {
  a: A;
  b: B;
  c: C;

  init() {
    self.a = A{val: 1};
    self.b = B{val: true};
    self.c = C{val: "xyz"};
  }
}