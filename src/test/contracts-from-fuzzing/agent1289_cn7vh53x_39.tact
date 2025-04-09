// test serialization of complex field chain with multiple serializations on optionals
struct Foo {
  a: Int? as uint8;
  b: Int? as coins;
  c: Int? as int64;
}

struct Bar {
  x: Foo?;
}

contract OptChainSerde {
  val: Bar;
  init() {
    self.val = Bar{ x: null };
  }
}
