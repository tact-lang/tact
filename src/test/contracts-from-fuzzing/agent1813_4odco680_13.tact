struct A {
  a: Int?;
  b: Bool;
}

struct B {
  a: Int;
  inner: A;
}

struct C {
  inner: B;
  b: Bool?;
  s: String;
}

contract MultiNestOpts {
  val: C;

  init() {
    self.val = C {
      inner: B{ a: 1, inner: A{ a: null, b: false } },
      b: null,
      s: "test"
    };
  }
}