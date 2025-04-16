struct Mid {
  left: Int;
  right: Int;
}

struct Root {
  first: Mid;
  second: Mid;
  flag: Bool;
}

contract DoubleMid {
  r: Root;

  init() {
    self.r = Root{
      first: Mid{ left:1, right:2 },
      second: Mid{ left:3, right:4 },
      flag: true
    };
  }
}