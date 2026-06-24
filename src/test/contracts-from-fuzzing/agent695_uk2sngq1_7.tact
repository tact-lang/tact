struct Inner {
    flag: Bool;
    num: Int;
}

struct Mid {
    inn: Inner;
    optStr: String?;
}

struct Outer {
    mid: Mid;
    addr: Address;
}

contract TripleNest {
    state: Outer;

    init() {
        self.state = Outer{
            mid: Mid{
                inn: Inner{
                    flag: false,
                    num: 123,
                },
                optStr: null,
            },
            addr: myAddress(),
        };
    }
}