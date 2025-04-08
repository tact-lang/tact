struct Wrapping {
  inside: InsideOpt?;
}

struct InsideOpt {
  here: Int;
}

contract DeepOptChain {
  data: Wrapping?;
  init() {
    self.data = null;
  }
}