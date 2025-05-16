struct ChainA {
    x: Int;
    b: ChainB;
}

struct ChainB {
    y: Int;
    c: ChainC;
}

struct ChainC {
    z: Int;
}

contract ChainTest {
    val: ChainA;
    init() {
        self.val = ChainA{
            x:1,
            b:ChainB{
                y:2,
                c:ChainC{z:3}
            }
        };
    }
}