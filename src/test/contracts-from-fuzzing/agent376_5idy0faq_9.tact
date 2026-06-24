struct InnerMost {
    b: Bool;
}

struct InnerMid {
    s: String?;
    nested: InnerMost;
}

struct InnerOuter {
    addr: Address;
    mid: InnerMid;
}

contract DeepChain {
    chain: InnerOuter;

    init() {
        self.chain = InnerOuter{
            addr: myAddress(),
            mid: InnerMid{
                s: null,
                nested: InnerMost{ b: true },
            },
        };
    }
}