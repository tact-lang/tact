struct U {
  u1: Int;
  u2: Bool;
}

struct V {
  v1: String;
  v2: Int?;
}

contract MultipleStructs {
  x: U;
  y: V;
  flag: Bool;

  init() {
    self.x = U{ u1: 13, u2: false };
    self.y = V{ v1: "hi", v2: null };
    self.flag = true;
  }
}
