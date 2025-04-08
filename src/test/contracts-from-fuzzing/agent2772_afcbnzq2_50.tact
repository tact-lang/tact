struct Nested {
  foo: Int;
}

contract StructDefaultNested {
  s: Nested = Nested{foo: 5};
}
