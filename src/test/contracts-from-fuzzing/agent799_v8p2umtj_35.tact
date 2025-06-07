// Nested structs with optional fields inside optional struct
struct InnerMost {
  val: Int?;
}

struct Inner {
  x: InnerMost?;
}

struct Outer {
  y: Inner?;
}

contract MultiOptLayers {
  data: Outer? = null;

  init() {
    self.data = Outer{
      y: Inner{
        x: InnerMost{val:123}
      }
    };
  }
}