struct ChainA { x: Int; }
struct ChainB { y: ChainA; }
struct ChainC { z: ChainB; }

contract ChainTest {
    root: ChainC;

    init() {
        self.root = ChainC{
            z: ChainB{
                y: ChainA{
                    x: 314
                }
            }
        };
    }
}
