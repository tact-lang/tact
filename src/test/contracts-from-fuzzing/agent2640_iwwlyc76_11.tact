struct IntChain {
    a: Int;
    b: Int as uint64;
    c: Int as int128;
    d: Int?;
    e: Int as coins;
    f: Int?;
}

contract TestContract {
    chain: IntChain;

    init() {
        self.chain = IntChain{
            a: 1,
            b: 2,
            c: 3,
            d: null,
            e: 10000000,
            f: 999
        };
    }
}
