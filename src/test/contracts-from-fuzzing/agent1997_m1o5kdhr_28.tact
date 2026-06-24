struct LeafA {
  x: Int;
}

struct LeafB {
  y: String;
}

struct LeafC {
  z: Bool;
}

struct Core {
  a: LeafA;
  b: LeafB;
  c: LeafC;
}

contract DeepMultiNest {
  core: Core;

  init() {
    self.core = Core{
      a: LeafA{ x: 1 },
      b: LeafB{ y: "hi" },
      c: LeafC{ z: false }
    };
  }
}
