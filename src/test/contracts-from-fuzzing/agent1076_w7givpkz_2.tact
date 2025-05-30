struct DeepNested {
  sub: NestedLevel;
}

struct NestedLevel {
  flag: Bool;
  point: Point;
}

struct Point {
  x: Int;
  y: Int;
}

contract TestDeep {
  info: DeepNested;

  init() {
    self.info = DeepNested{sub: NestedLevel{flag: true, point: Point{x: 10, y: -10}}};
  }
}
