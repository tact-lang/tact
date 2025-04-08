struct Inner {
  x: Int? = null;
  y: Bool? = true;
}

contract Test {
  nested: Inner = Inner{};
}