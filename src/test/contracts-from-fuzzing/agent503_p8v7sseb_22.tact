struct Bottom {
  x: Int;
}

struct Mid {
  opt: Bottom?;
}

struct Top {
  mid: Mid;
}

contract DeepOptTree {
  data: Top;

  init() {
    self.data = Top{
      mid: Mid {
        opt: Bottom{ x: 13 }
      }
    };
  }
}
