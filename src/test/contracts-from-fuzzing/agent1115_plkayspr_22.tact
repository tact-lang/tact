struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    done: Bool;
}

contract LinearDeep {
    ptr: ChainA;

    init() {
        self.ptr = ChainA { next: ChainB { next: ChainC { done: true } } };
    }
}
