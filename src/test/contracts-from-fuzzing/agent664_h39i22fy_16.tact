// more deeply nested composite with nullable inner structs

struct InnerMost {
  x: Int;
}

struct MidOpt {
  inner: InnerMost?;
}

struct Top {
  mid: MidOpt;
}

contract Test {
  state: Top;

  init() {
    self.state = Top{
      mid: MidOpt{
        inner: null,
      },
    };
  }
}