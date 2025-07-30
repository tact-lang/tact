struct ChainB {
    valb: Int;
}

struct ChainA {
    aField: Int;
    next: ChainB;
}

contract ChainTest {
    cfield: ChainA;

    init() {
        self.cfield = ChainA{
            aField: 7,
            next: ChainB{ valb: 8 }
        };
    }
}