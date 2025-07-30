// Deep nested optional struct chain in contract variable
struct Tail {
  endVal: Bool;
}

struct Mid {
  tail: Tail?;
}

struct Head {
  mid: Mid?;
}

contract Test {
  chain: Head?;

  init() {
    self.chain = null;
  }
}