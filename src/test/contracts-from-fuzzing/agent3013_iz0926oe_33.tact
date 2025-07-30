struct Bottom {
  boolf: Bool?;
}

struct Middle {
  inner: Bottom?;
}

contract OptionalCave {
  mid: Middle?;

  init() {
    self.mid = null;
  }
}
