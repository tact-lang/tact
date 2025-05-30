struct DeepChain {
    a: Chain1;
}

struct Chain1 {
    b: Chain2;
}

struct Chain2 {
    c: Chain3;
}

struct Chain3 {
    d: Chain4;
}

struct Chain4 {
    e: Chain5;
}

struct Chain5 {
    f: Int;
}

contract TestContract {
    chain: DeepChain;

    init() {
        self.chain = DeepChain{
            a: Chain1{
                b: Chain2{
                    c: Chain3{
                        d: Chain4{
                            e: Chain5{
                                f: 42
                            }
                        }
                    }
                }
            }
        };
    }
}