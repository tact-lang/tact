struct Flat {
  a: Int;
  b: Int;
}

struct Nested {
  flat: Flat;
  c: Bool;
}

contract StructDefaultsTest {
  nested: Nested = Nested{
    flat: Flat{ a:1, b:2 },
    c: true
  };
}