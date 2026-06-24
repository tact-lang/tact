struct Chain {
    a: Int;
    b: Chain2;
}

struct Chain2 {
    b: Int;
    c: Chain3;
}

struct Chain3 {
    c: Int;
}

contract DeepChain {
    var: Chain;

    init() {
        self.var = Chain{
            a: 10,
            b: Chain2{
                b: 20,
                c: Chain3{ c: 30 }
            }
        };
    }
}