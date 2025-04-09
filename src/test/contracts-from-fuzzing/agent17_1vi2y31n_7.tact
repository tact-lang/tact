struct Deep3 {
  x: Int;
}

struct Deep2 {
  inner: Deep3;
}

struct Deep1 {
  wrap: Deep2;
}

contract DeeplyNested {
  val: Deep1;

  init() {
    self.val = Deep1{ wrap: Deep2{ inner: Deep3{ x: 123 } } };
  }
}