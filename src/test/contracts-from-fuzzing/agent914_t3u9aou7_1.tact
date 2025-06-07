struct NestInner {
  a: Int;
  b: Bool?;
}

struct NestOuter {
  inner1: NestInner;
  inner2: NestInner;
}

contract DeeplyNestedStruct {
  data: NestOuter;

  init() {
    self.data = NestOuter{
      inner1: NestInner{a: 1, b: true},
      inner2: NestInner{a: 2, b: null},
    };
  }
}