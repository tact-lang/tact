struct Nested {
  inner: Inner;
  flag: Bool = false;
}

struct Inner {
  x: Int = 1;
  y: String?;
}

contract Test {
  data: Nested;
  init() { self.data = Nested{ inner: Inner{}, flag: true }; }
}