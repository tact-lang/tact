struct IntBoolChain {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
}

contract TestContract {
    chain: IntBoolChain;

    init() {
        self.chain = IntBoolChain{
            a: 1,
            b: true,
            c: 3,
            d: false,
            e: 5,
            f: false,
            g: 7,
            h: true
        };
    }
}
