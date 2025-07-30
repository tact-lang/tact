struct ChainA { a: Int; }
struct ChainB { b: ChainA; }
struct ChainC { c: ChainB; }
struct ChainD { d: ChainC; }

contract Test {
  data: ChainD;
  init() {
    self.data = ChainD{d: ChainC{c: ChainB{b: ChainA{a:33}}}};
  }
}