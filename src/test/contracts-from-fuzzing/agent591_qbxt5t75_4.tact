struct ChainA { next: ChainB; }
struct ChainB { next: ChainC; }
struct ChainC { endVal: Int; }

contract ChainUsr {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            next: ChainB{
                next: ChainC{
                    endVal: 123
                }
            }
        };
    }
}