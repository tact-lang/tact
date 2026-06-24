struct Chain1 {
    a: Chain2;
}

struct Chain2 {
    b: Chain3;
}

struct Chain3 {
    c: Chain4;
}

struct Chain4 {
    d: Int;
}

contract DeepChain {
    f: Chain1;

    init() {
        self.f = Chain1{
            a: Chain2{
                b: Chain3{
                    c: Chain4{
                        d: 777
                    }
                }
            }
        };
    }
}