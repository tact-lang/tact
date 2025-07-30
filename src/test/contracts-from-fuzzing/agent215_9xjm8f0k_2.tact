struct Inner {
  a: Int;
  b: Bool;
  c: String;
}

contract TestContract {
  nested: Inner = Inner{a: 1, b: true, c: "hi"};
}