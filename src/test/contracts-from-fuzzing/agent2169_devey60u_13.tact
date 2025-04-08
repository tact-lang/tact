struct Deep {
  a: Int;
}

struct Wrap1 {
  v: Deep?;
}

struct Wrap2 {
  v: Wrap1?;
}

contract NullChains {
  chain: Wrap2;

  init() {
    self.chain = Wrap2{v:null};
  }
}