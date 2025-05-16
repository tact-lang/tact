struct MidDefault {
    x: Int = 1;
    s: String = "hi";
}

struct OuterChain {
    m: MidDefault;
    y: Int;
}

contract DefaultsInChain {
    chain: OuterChain;

    init() {
        self.chain = OuterChain{
            m: MidDefault{},
            y: 42
        };
    }
}