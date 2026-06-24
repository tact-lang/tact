struct A {
  x: Int;
  y: B;
}

struct B {
  z: Int;
  t: C;
}

struct C {
  u: Int;
  v: String;
}

contract TestContract {
  field: A;

  init() {
    self.field = A{
      x:1,
      y:B{
        z:2,t:C{u:3,v:"hello"}
      }
    };
  }
}