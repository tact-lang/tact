struct ChainA {
    v1: Int;
    next: ChainB;
}

struct ChainB {
    v2: Bool;
    next: ChainC;
}

struct ChainC {
    v3: String;
}

contract ChainNestedTest {
    data: ChainA;

    init() {
        self.data = ChainA {
            v1: 7,
            next: ChainB {
                v2: true,
                next: ChainC {
                    v3: "end"
                }
            }
        };
    }
}