struct OptionChain {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
}

contract TestContract {
    chain: OptionChain;

    init() {
        self.chain = OptionChain{
            a: null,
            b: 1,
            c: null,
            d: 2,
            e: null,
        };
    }
}
