struct DeepLevel2 {
    e: Int;
    f: Bool;
}

struct DeepLevel1 {
    c: Int;
    d: DeepLevel2;
}

struct TopLevel {
    a: Int;
    b: DeepLevel1;
}

contract DeepChain {
    nested: TopLevel;

    init() {
        self.nested = TopLevel {
            a: 1,
            b: DeepLevel1 {
                c: 2,
                d: DeepLevel2 {
                    e: 3,
                    f: true
                }
            }
        };
    }
}