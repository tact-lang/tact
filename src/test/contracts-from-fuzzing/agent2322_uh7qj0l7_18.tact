struct MixNested {
  foo: Int;
  bar: String;
  baz: Bool?;
  inner: Deeper;
}

struct Deeper {
  s: String?;
  num: Int;
}

contract MixedTest {
  m: MixNested = MixNested{
    foo: 5,
    bar: "hello",
    baz: null,
    inner: Deeper{
      s: null,
      num: 9
    }
  };

  init() {}
}
