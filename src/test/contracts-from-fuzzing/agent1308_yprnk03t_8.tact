struct A {
  x: Int;
  y: Int;
}

struct B {
  a: A;
  z: Bool;
}

struct C {
  b: B;
  flag: Bool?;
}

contract TestContract {
  val: C;

  init() {
    self.val = C {
      b: B {
        a: A { x: 1, y: 2 },
        z: false
      },
      flag: null
    };
  }
}