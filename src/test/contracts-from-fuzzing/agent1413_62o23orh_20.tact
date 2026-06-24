struct OptionalChain {
    first: Int?;
    second: Int?;
    third: Int?;
}

contract ChainContract {
    chain: OptionalChain;
    init() {
        self.chain = OptionalChain{
            first:null,
            second:null,
            third:null
        };
    }
}