struct Bottom {
  x: Int as int64;
}

struct Mid {
  b: Bottom;
}

struct Top {
  m: Mid;
}

contract OnlyBottomTagged {
  data: Top;

  init() {
    self.data = Top{
      m: Mid{
        b: Bottom{ x: 99999 }
      }
    };
  }
}
