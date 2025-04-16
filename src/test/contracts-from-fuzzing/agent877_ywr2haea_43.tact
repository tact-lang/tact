// Optional nested struct with explicit nulls, multiple layers
struct I1 {
  s: String?;
}

struct I2 {
  i1: I1?;
}

contract OptOptLayered {
  storage: I2?;

  init() {
    self.storage = I2{
      i1: null,
    };
  }
}