struct InnerMost {
  p: Int;
  q: Bool;
}

struct Middle {
  nested: InnerMost;
  comment: String;
}

struct Top {
  middle: Middle;
  count: Int;
}

contract TestContract {
  data: Top;

  init() {
    self.data = Top {
      middle: Middle {
        nested: InnerMost {
          p: 999,
          q: true,
        },
        comment: "deep",
      },
      count: 123,
    };
  }
}