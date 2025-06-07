// deeply nested optionals with struct layering
struct InnerMost {
  val: Int?;
}

struct Middle {
  inner: InnerMost?;
}

struct Outer {
  mid: Middle?;
}

contract DeepOptionStructs {
  data: Outer;

  init() {
    self.data = Outer{ mid: null };
  }
}