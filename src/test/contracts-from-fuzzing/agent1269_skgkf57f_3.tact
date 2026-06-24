struct A {
  a: Int;
  b: Int?;
  c: Int;
}

struct B {
  x: A;
  y: Int?;
  z: Int;
}

struct Container {
  outer: B;
}

contract DeepContainer {
  state: Container;

  init() {
    self.state = Container{
      outer: B{
        x: A{ a:1, b:null, c:2 },
        y: null,
        z: 3,
      }
    };
  }
}