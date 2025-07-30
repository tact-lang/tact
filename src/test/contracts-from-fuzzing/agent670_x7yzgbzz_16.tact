struct ChainA{ x:Int }
struct ChainB{ y:ChainA }
struct ChainC{ z:ChainB }
struct ChainD{ q:ChainC }

contract LongChain {
    top: ChainD;

    init() {
        self.top = ChainD{
            q: ChainC{
                z: ChainB{
                    y: ChainA{ x: 55 }
                }
            }
        };
    }
}