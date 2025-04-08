// Test optional persistent var from struct with defaulted nested struct

struct Inner {
  a: Int?;
  b: Bool = true;
}

struct Outer {
  inside: Inner = Inner{};
  s: String?;
}

contract OptStructWithDefaults {
  opt: Outer?;

  init() {
    self.opt = Outer{
      inside: Inner{
        a: null,
        b: false
      },
      s: "abc"
    };
  }
}