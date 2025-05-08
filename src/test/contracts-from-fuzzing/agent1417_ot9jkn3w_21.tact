struct NestingOptionalInner {
  value: Int;
}

struct NestingOptionalOuter {
  nested: NestingOptionalInner?;
  flag: Bool;
}

contract Foo {
  s: NestingOptionalOuter?;
  n: Int;

  init() {
    self.s = NestingOptionalOuter {
      nested: NestingOptionalInner { value: 42 },
      flag: false
    };
    self.n = 7;
  }
}