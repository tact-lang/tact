struct ChainA {
  b: ChainB;
  val: Int;
}
struct ChainB {
  c: ChainC;
  val: Int;
}
struct ChainC {
  d: ChainD;
  val: Int;
}
struct ChainD {
  val: Int;
}

contract Test {
  big: ChainA;
  init() {
    self.big = ChainA{
      val: 1,
      b: ChainB{
        val: 2,
        c: ChainC{
          val: 3,
          d: ChainD{ val: 4 }
        }
      }
    };
  }
}