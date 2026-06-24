struct ChainA { b: ChainB }
struct ChainB { c: ChainC }
struct ChainC { d: ChainD }
struct ChainD { e: ChainE }
struct ChainE { leaf: Int }

contract DeepChainTest {
    chain: ChainA;

    init() {
        self.chain = ChainA{
            b: ChainB{
                c: ChainC{
                    d: ChainD{
                        e: ChainE{leaf:123}
                    }
                }
            }
        };
    }

    receive() {
        let _ = self.chain.b.c.d.e.leaf;
    }
}