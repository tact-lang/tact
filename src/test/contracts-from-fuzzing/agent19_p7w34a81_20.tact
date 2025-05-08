struct Chain1 {
    foo: Int;
}

struct Chain2 {
    c1: Chain1;
    bar: Bool;
}

struct Chain3 {
    c2: Chain2;
    baz: String;
}

struct Chain4 {
    c3: Chain3;
    qux: Bool;
}

contract FourLayerChain {
    chain: Chain4;

    init() {
        self.chain = Chain4{
            c3: Chain3{
                c2: Chain2{
                    c1: Chain1{ foo: 11 },
                    bar: true,
                },
                baz: "bbb",
            },
            qux: false,
        };
    }
}