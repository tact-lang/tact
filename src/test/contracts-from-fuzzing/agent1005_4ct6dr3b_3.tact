struct DeepInner {
  z: Int;
}

struct Middle {
  y: DeepInner;
}

struct Outer {
  x: Middle;
}

contract TestDeep {
  deep: Outer;

  init() {
    self.deep = Outer{ x: Middle{ y: DeepInner{z: 42} } };
  }
}