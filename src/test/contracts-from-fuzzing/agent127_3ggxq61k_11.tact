struct SubInner {
  foo: Int;
}

struct Inner {
  a: Int;
  b: SubInner;
}

struct Outer {
  inner1: Inner;
  inner2: Inner;
}

contract DeepMultiNested {
  big: Outer;

  init() {
    self.big = Outer{
      inner1: Inner{ a: 1, b: SubInner{foo: 42}},
      inner2: Inner{ a: 2, b: SubInner{foo: 43}}
    };
  }
}