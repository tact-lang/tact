struct TailRem {
  x: Int;
  remain: Slice as remaining;
}

struct NestRem {
  nested: TailRem;
}

contract RemInWrap {
  state: NestRem;

  init() {
    self.state = NestRem{
      nested: TailRem{
        x: 5,
        remain: emptyCell().asSlice()
      }
    };
  }
}