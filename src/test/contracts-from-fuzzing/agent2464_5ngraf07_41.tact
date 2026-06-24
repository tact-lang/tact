struct Chain {
    a: Int;
    nested: Chain2;
}

struct Chain2{
    b: Int;
    nested2: Chain3;
}

struct Chain3{
    c: Int;
}

contract ChainContract {
    s: Chain;
    init() {
        self.s = Chain{
            a: 1,
            nested: Chain2{
                b: 2,
                nested2: Chain3{
                    c: 3
                }
            }
        };
    }
}
