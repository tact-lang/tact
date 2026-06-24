struct A {
  f: Int;
}
struct B {
  f: Bool;
}
struct C {
  f: String;
}

contract MultiTypes {
  a: A;
  b: B;
  c: C;

  init() {
    self.a = A{f:1};
    self.b = B{f:true};
    self.c = C{f:"x"};
  }
}