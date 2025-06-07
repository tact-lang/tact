struct Nested {
  a: Int;
  b: Bool;
  c: String?;
}

contract DeepTest {
  n1: Nested = Nested{ a: 1, b: true, c: null };
  n2: Nested = Nested{ a: 2, b: false, c: "x" };

  init() {}
}