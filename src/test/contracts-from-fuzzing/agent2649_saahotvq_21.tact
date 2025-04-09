struct ChainA {
    next: ChainB?;
}

struct ChainB {
    next: ChainC?;
}

struct ChainC {
    val: Int;
}

contract LinkedOption {
    state: ChainA;

    init() {
        self.state = ChainA{
            next: null,
        };
    }
}