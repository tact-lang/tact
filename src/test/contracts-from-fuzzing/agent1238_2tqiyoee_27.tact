struct Bottom {
  x: Int;
}

struct Middle {
  bot: Bottom;
}

struct Top {
  mid: Middle;
}

contract NestedOptionalStructsTest {
  t: Top?;

  init() {
    self.t = Top{
      mid: Middle {
        bot: Bottom { x: 3 }
      }
    };
  }
}