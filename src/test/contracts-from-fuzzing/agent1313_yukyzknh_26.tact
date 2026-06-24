struct A { i: Int; }
struct B { s: String; }
struct C { b: Bool; }

contract MixedStructFields {
  a: A;
  b: B;
  c: C;

  init() {
    self.a = A{i:1};
    self.b = B{s:"z"};
    self.c = C{b:true};
  }
}