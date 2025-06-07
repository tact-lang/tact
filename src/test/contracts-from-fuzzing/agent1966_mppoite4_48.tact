struct Top {
  bot: Bottom;
}

struct Bottom {
  s: String?;
}

contract NullStrNested {
  val: Top;

  init() {
    self.val = Top{
      bot: Bottom{ s: null }
    };
  }
}
