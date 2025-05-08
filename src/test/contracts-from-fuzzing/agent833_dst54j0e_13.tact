struct OptionChain {
    a: Int?;
    b: OptionInner?;
}

struct OptionInner {
    s: String?;
    flag: Bool;
}

contract TestContract {
    chain: OptionChain;

    init() {
        self.chain = OptionChain{
            a: null,
            b: OptionInner{ s: null, flag: true },
        };
    }
}
