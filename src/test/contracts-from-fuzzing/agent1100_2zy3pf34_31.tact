struct NestOne {
  a: Int;
}

struct NestTwo {
  s: NestOne?;
}

contract OptStructInStruct {
  f: NestTwo;

  init() {
    self.f = NestTwo{
      s: null
    };
  }
}
