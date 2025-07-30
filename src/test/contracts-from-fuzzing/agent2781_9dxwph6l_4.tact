struct Nested {
  foo: Int?;
  bar: Bool;
}

contract Test {
  data: Nested = Nested{
    foo: 999,
    bar: true,
  };
}