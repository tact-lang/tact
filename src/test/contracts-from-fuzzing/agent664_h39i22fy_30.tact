struct Deep {
  v: Int? = 1;
}

struct Mid {
  d: Deep? = null;
}

contract Test {
  state: Mid? = null;

  init() {
    self.state = Mid{
      d: Deep{
        v: 123,
      },
    };
  }
}