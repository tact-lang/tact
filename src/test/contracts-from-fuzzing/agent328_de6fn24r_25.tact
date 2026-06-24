struct Chain1 {
    a: Int;
}

struct Chain2 {
    prev: Chain1;
    b: Int;
}

struct Chain3 {
    prev: Chain2;
    c: Int;
}

contract Test {
    chain: Chain3;
    init() {
        self.chain = Chain3{
            prev: Chain2{ prev: Chain1{ a: 1 }, b:2 },
            c:3
        };
    }
}