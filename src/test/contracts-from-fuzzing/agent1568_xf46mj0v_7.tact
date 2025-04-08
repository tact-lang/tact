struct A {
  a: Int;
}

struct B {
  b: Int;
}

struct Wrapper {
  aw: A?;
  bw: B?;
}

contract MultiOptionals {
  w: Wrapper;

  init() {
    self.w = Wrapper{
      aw: null,
      bw: B{b:123},
    };
  }
}