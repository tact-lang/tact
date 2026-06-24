struct Bottom {
  first: Int;
  rest: Slice as remaining;
}

struct Middle {
  bottom: Bottom;
}

struct Top {
  mid: Middle;
}

contract Test {
  t: Top;

  init() {
    self.t = Top{
      mid: Middle{
        bottom: Bottom{
          first: 1,
          rest: emptyCell().asSlice(),
        }
      }
    };
  }
}