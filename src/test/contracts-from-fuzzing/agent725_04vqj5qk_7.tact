struct Chain3 {
    a: Int;
    b: Bool;
}

struct Chain2 {
    inner: Chain3;
    name: String;
}

struct Chain1 {
    sub: Chain2;
    addr: Address;
}

contract NestedChains {
    chain: Chain1;

    init() {
        self.chain = Chain1{
            sub: Chain2{
                inner: Chain3{
                    a: 5,
                    b: true,
                },
                name: "deep",
            },
            addr: myAddress(),
        };
    }
}