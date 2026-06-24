struct ChainA {
    next: ChainB;
}

struct ChainB {
    next: ChainC;
}

struct ChainC {
    txt: String;
    flag: Bool;
}

contract TestContract {
    data: ChainA;

    init() {
        self.data = ChainA{
            next: ChainB{
                next: ChainC{
                    txt: "last",
                    flag: true
                }
            }
        };
    }
}
