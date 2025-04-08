struct SerInt {
  a: Int as uint4;
  b: Int as int8;
}

struct SerOuter {
  s: SerInt;
  val: Int;
}

contract SerialNested {
  data: SerOuter;

  init() {
    self.data = SerOuter{
      s: SerInt{a:3,b:-8},
      val: 123
    };
  }
}
