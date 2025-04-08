struct OptionalChain {
    first: Int?;
    second: Bool?;
    third: String?;
}

contract OptionalChainContract {
    chain: OptionalChain;

    init() {
        self.chain = OptionalChain{
            first: null,
            second: true,
            third: null
        };
    }
}