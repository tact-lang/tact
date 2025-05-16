struct DeepChain {
    a: Int;
}

struct MidChain {
    link: DeepChain;
}

struct HiChain {
    up: MidChain;
}

contract ChainStore {
    base: HiChain;

    init() {
        self.base = HiChain{
            up: MidChain{
                link: DeepChain{a: 7},
            },
        };
    }
}