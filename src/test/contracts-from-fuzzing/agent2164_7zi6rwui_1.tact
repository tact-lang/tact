struct DeeplyNested {
  a: Int;
  nested: OptionalNested;
}

struct OptionalNested {
  b: Int?;
  c: InnerMost;
}

struct InnerMost {
  d: Int?;
}

contract Test {
  data: DeeplyNested;

  init() {
    self.data = DeeplyNested {
      a: 1,
      nested: OptionalNested {
        b: null,
        c: InnerMost {
          d: null
        }
      }
    };
  }
}
