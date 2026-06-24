struct Leaf {
  v: Int? = null;
}

struct Mid {
  leaf: Leaf;
  flag: Bool? = null;
}

struct Root {
  mid: Mid;
  msg: String? = null;
}

contract DeepDefaults {
  data: Root;

  init() {
    self.data = Root{
      mid: Mid{
        leaf: Leaf{ v: 42 },
        flag: true,
      },
      msg: "hello",
    };
  }
}