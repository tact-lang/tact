struct NestedMixed {
  a: Int;
  b: String;
  c: Inner;
}

struct Inner {
  d: Int;
  e: String;
  f: Inner2;
}

struct Inner2 {
  g: Int;
  h: String;
}

contract StorageTest {
  nested: NestedMixed;
  init() {
    self.nested = NestedMixed{
      a:1,
      b:"hi",
      c: Inner{
        d:2,
        e:"hello",
        f: Inner2{ g:3, h:"bye" }
      }
    };
  }
}