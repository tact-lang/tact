struct Inner {
  a: Int? = null;
  b: Bool? = true;
}

struct Outer {
  inner: Inner;
  x: Int;
}

contract TestContract {
  o: Outer;

  init() {
    self.o = Outer{
      inner: Inner{},
      x: 5
    };
  }
}