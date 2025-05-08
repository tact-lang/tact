struct ChainA {
    val: Int;
}

struct ChainB {
    next: ChainA;
}

struct ChainC {
    next: ChainB;
}

struct ChainD {
    next: ChainC;
}

contract ChainContract {
    link: ChainD = ChainD{next:ChainC{next:ChainB{next:ChainA{val:77}}}};
    init() {
        self.link = ChainD{next:ChainC{next:ChainB{next:ChainA{val:88}}}};
    }
    receive() {}
}