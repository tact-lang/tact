// Contract with persistent state of a struct with deeply nested inner optional structs
struct InnerMost {
  a: Int;
  b: Bool?;
}

struct MidLevel {
  inner: InnerMost?;
}

struct TopLevel {
  mid: MidLevel;
}

contract DeepOptionalStructs {
  data: TopLevel;

  init() {
    self.data = TopLevel{
      mid: MidLevel{
        inner: null
      }
    };
  }
}
