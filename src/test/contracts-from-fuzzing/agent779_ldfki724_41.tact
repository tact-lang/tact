struct A {
  s: String?;
  b: Bool?;
}

struct B {
  a: A;
  s: String?;
  b: Bool?;
}

contract NestOpts {
  val: B;

  init() {
    self.val = B{
      a: A{ s: null, b: true },
      s: null,
      b: false
    };
  }
}