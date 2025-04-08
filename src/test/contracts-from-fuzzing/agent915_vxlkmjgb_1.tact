struct BigNested1 {
  foo: Int;
  bar: Bool;
  opt: Int?;
}

struct BigNested2 {
  a: BigNested1;
  b: Bool;
  c: BigNested1;
}

contract DeepOptionals {
  data: BigNested2;

  init() {
    self.data = BigNested2{
      a: BigNested1{ foo: 10, bar: true, opt: null },
      b: false,
      c: BigNested1{ foo: 20, bar: false, opt: 123 }
    };
  }
}
