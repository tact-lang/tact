struct OptDeep {
  inner: Int?;
}

struct Top {
  nested: OptDeep?;
}

contract OptOptEdge {
  data: Top;

  init() {
    self.data = Top{nested: null};
  }
}