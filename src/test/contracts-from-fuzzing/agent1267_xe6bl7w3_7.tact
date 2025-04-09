struct Inner1 { x: Int; }
struct Inner2 { y: Int; }
struct Container {
  i1: Inner1;
  i2: Inner2;
  a: Int;
}

contract CrossStructs {
  data: Container;

  init() {
    self.data = Container{
      i1: Inner1{ x: 1 },
      i2: Inner2{ y: 2 },
      a: 3
    };
  }
}
