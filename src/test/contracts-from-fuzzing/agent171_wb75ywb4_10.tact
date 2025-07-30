struct OptionChain {
    foo: Level1?;
}

struct Level1 {
    bar: Level2?;
}

struct Level2 {
    baz: Int?;
}

contract ChainOpt {
    chain: OptionChain;
    init() {
        self.chain = OptionChain{ foo: null };
    }
}