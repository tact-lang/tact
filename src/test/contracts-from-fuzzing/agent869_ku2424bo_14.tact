struct OptionalChain {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptChainContract {
    chain: OptionalChain;

    init() {
        self.chain = OptionalChain{
            a: null,
            b: 5,
            c: null,
        };
    }

    receive() {}
}
