struct Inner1 {
  a: Int = 1;
}

struct Inner2 {
  b: Bool = true;
}

struct Outer {
  x: Inner1;
  y: Inner2;
}

contract NestedMultiType {
  s: Outer = Outer{x: Inner1{a: 2}, y: Inner2{b: false}};

  receive() {
    self.s = Outer{x: Inner1{a: 500}, y: Inner2{b: true}};
  }
}