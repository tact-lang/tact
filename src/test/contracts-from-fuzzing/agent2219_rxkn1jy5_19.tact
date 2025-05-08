struct ChainA { x: Int; }
struct ChainB { y: ChainA; }
struct ChainC { z: ChainB; }

contract ChainNest {
    val: ChainC;

    init() {
        self.val = ChainC{ z: ChainB{ y: ChainA{ x: 55 } } };
    }
}