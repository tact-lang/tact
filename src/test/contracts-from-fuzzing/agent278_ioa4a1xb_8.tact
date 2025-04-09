struct ChainA {
    b: ChainB;
}
struct ChainB {
    c: ChainC;
}
struct ChainC {
    d: Int;
}

contract ChainTest {
    val: ChainA;
    init() {
        self.val = ChainA{
            b: ChainB{
                c: ChainC{
                    d: 7
                }
            }
        };
    }
}