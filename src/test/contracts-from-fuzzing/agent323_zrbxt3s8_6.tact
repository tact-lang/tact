struct Inner {
  a: Int;
}

struct Outer {
  b: Inner?;
}

contract NestOpt {
  data: Outer;

  init() {
    self.data = Outer{ b: null };
  }
}