struct DeepInner {
  a: Int = 5;
  b: Int?;
  c: Bool?;
  d: String = "hi";
}

struct OuterNest {
  inner: DeepInner;
  flag: Bool = false;
}

contract ComplexDefaults {
  content: OuterNest;

  init() {
    self.content = OuterNest{
      inner: DeepInner{
        a: 42,
        b: null,
        // omit 'c' (should default to null)
        // omit 'd' (defaults to "hi")
      },
      // omit 'flag', should default to false
    };
  }
}