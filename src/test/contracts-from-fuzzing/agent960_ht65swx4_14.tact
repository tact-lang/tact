struct ChainA { next: ChainB }
struct ChainB { next: ChainC }
struct ChainC { next: ChainD }
struct ChainD { val: Int }

contract ChainTest {
    chain: ChainA;
    init() {
        self.chain = ChainA{
            next: ChainB{
                next: ChainC{
                    next: ChainD{
                        val: 123
                    }
                }
            }
        };
    }
}