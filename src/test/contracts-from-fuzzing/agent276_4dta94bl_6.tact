struct Z {
  num: Int?;
}

struct Y {
  optZ: Z?;
}

struct X {
  optY: Y?;
}

contract ChainOfOpts {
  data: X;

  init() {
    self.data = X{
      optY: null,
    };
  }
}
