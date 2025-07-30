struct ChainA {
  x: Int;
}

struct ChainB {
  ca: ChainA;
}

struct ChainC {
  cb: ChainB;
}

struct ChainD {
  cc: ChainC;
}

contract ChainFields {
  cf: ChainD;

  init() {
    self.cf = ChainD{cc: ChainC{cb: ChainB{ca: ChainA{x: 1}}}};
  }
}