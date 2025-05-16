// Nested contract storage with many optional and nested structs
struct Inner {
  x: Int?;
  y: Bool;
  z: String?;
}

struct Middle {
  inner: Inner?;
}

contract ComplexStorage {
  m: Middle?;

  init() {
    self.m = Middle{
      inner: Inner{
        x: null,
        y: true,
        z: null,
      },
    };
  }
}