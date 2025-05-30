// Test nested empty optional struct (should be legal)
struct M {
  a: Int?;
  b: Bool?;
}

struct Wrapper {
  inner: M?;
}

contract OptStructWrap {
  w: Wrapper;
  init() {
    self.w = Wrapper{ inner: null };
  }
}