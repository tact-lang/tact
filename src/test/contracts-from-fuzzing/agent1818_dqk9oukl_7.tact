struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    flag: Bool;
}

contract ChainStorage {
    root: ChainA;

    init() {
        self.root = ChainA{
            next: ChainB{
                next: ChainC{
                    flag: true
                }
            }
        };
    }
}
