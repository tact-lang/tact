struct ChainA { x:Int; }
struct ChainB { y:Int; a:ChainA; }
struct ChainC { z:Int; b:ChainB; }
struct ChainD { w:Int; c:ChainC; }

contract DeepChainStorage {
  deep: ChainD;

  init() {
    self.deep = ChainD{
      w: 4,
      c: ChainC{
        z:3,
        b: ChainB{
          y:2,
          a: ChainA{ x:1 }
        }
      }
    };
  }
}