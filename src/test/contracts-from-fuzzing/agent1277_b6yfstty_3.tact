struct Deep {
  x: Int;
  y: Bool;
}

struct Mid {
  deep: Deep;
  val: Int?;
}

struct Top {
  mid: Mid;
  extra: Bool?;
}

contract TestContract {
  state: Top;
  init() {
    self.state = Top{
      mid: Mid{
        deep: Deep{x: 10, y: false},
        val: null
      },
      extra: true
    };
  }
}