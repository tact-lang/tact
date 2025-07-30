struct OptionalChain {
    nested1: Bool?;
    nested2: Int?;
    nested3: String?;
}

contract OptionalPersist {
    chain: OptionalChain;

    init() {
        self.chain = OptionalChain{
            nested1: true,
            nested2: 123,
            nested3: "abc"
        };
    }
}