struct Inner {
  a: Int;
  b: Bool;
}

contract Test {
  nested: Inner = Inner{ a: 10, b: true };
}