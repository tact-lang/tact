struct NestedDflt {
  inner: InnerDflt;
}

struct InnerDflt {
  x: Int = 5;
  y: String = "hi";
}

contract DefaultInNested {
  s: NestedDflt;

  init() {
    self.s = NestedDflt{
      inner: InnerDflt{}
    };
  }
}
