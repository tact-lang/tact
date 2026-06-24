struct ChainA {
    next: ChainB?;
}

struct ChainB {
    next: ChainC?;
}

struct ChainC {
    data: Int?;
}

contract NullableTail {
    head: ChainA;
    init() {
        self.head = ChainA{ next: null };
    }
}