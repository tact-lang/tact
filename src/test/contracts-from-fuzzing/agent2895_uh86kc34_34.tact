struct A {
  f1: Int;
  f2: Bool;
  f3: String;
}

struct B {
  a: A;
  f4: Int;
}

struct C {
  b: B;
  f5: String;
}

contract ChainFull {
  val: C;

  init() {
    self.val = C{
      b: B{
        a: A{ f1: 1, f2: true, f3: "x" },
        f4: 2
      },
      f5: "y"
    };
  }
}
