struct ChainA {
    val: Int;
    next: ChainB;
}

struct ChainB {
    val: Int;
    next: ChainC;
}

struct ChainC {
    val: Int;
}

contract ChainContract {
    chain: ChainA;
    init() {
        self.chain = ChainA{val:1,next:ChainB{val:2,next:ChainC{val:3}}};
    }
}