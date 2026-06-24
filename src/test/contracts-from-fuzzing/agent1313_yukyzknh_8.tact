struct Inner1 {
  x: Int;
}

struct Inner2 {
  y: Bool;
}

struct Inner3 {
  z: String;
}

struct Outer {
  i1: Inner1;
  i2: Inner2;
  i3: Inner3;
}

contract MultiStructMix {
  state: Outer;

  init() {
    self.state = Outer{
      i1: Inner1{x: 1},
      i2: Inner2{y: true},
      i3: Inner3{z: "hi"}
    };
  }
}