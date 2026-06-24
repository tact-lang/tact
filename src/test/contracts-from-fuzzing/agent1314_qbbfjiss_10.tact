struct Inner1 { x: Int; }
struct Inner2 { y: Int; }
struct Inner3 { z: Int; }

struct Composite {
  a: Inner1;
  b: Inner2;
  c: Inner3;
}

contract CompositeStruct {
  cs: Composite;

  init() {
    self.cs = Composite{
      a: Inner1{ x: 1 },
      b: Inner2{ y: 2 },
      c: Inner3{ z: 3 },
    };
  }
}