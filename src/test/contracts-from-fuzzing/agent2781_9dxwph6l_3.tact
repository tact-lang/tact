struct DeepInner {
  z: Bool = true;
}

struct Nested {
  foo: Int;
  bar: DeepInner?;  // optional struct
}

contract Test {
  data: Nested = Nested{
    foo: 123,
    bar: null,   // optional struct explicitly null
  };
}