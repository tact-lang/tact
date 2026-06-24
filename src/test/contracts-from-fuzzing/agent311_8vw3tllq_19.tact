struct SerializeNested {
  a: SInner;
  b: Int as uint16;
}
struct SInner {
  x: Int as uint4;
  y: Int as int8;
}

contract SerializeNest {
  data: SerializeNested;

  init() {
    self.data = SerializeNested{
      a: SInner{ x: 5, y: -100 },
      b: 65000
    };
  }
}