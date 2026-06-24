struct Inner {
  a: Int;
  b: Int?;
}

contract Inline {
  inner: Inner = Inner{ a: 33, b: null };
  receive() {}
}