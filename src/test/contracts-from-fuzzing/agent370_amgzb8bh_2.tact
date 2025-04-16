struct Leaf {
  lval: Int;
  lflag: Bool;
}

struct Mid {
  mid_val: Int;
  leaf: Leaf;
}

struct Top {
  top_flag: Bool?;
  mid: Mid;
  note: String;
}

contract DeepNest {
  data: Top;

  init() {
    self.data = Top{
      top_flag: null,
      mid: Mid{
        mid_val: 42,
        leaf: Leaf{ lval: 1, lflag: true }
      },
      note: "test"
    };
  }
}