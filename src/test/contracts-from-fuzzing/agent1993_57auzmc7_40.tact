struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    val: Int;
}

contract TestContract {
    c: ChainA;

    init() {
        self.c = ChainA{ next: ChainB{ next: ChainC{ val:5 } } };
    }
}