struct ChainA { x: Int; next: ChainB; }
struct ChainB { y: Int; next: ChainC; }
struct ChainC { z: Int; }

contract ChainTest {
    data: ChainA;

    init() {
        self.data = ChainA{
            x:1,
            next: ChainB{
                y:2,
                next: ChainC{ z:3 }
            }
        };
    }
}