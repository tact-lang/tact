struct Nested {
  x: Int;
  y: Int?;
  z: Bool;
}

struct Outer {
  n: Nested;
  flag: Bool;
}

contract DeepTest {
  data: Outer;

  init() {
    self.data = Outer{n: Nested{x:1, y:null, z:true}, flag: false};
  }
}