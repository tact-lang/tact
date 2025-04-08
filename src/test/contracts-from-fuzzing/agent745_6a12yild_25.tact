struct Chain1 {
    foo: Int;
}

struct Chain2 {
    c1: Chain1;
}

struct Chain3 {
    c2: Chain2;
}

struct Chain4 {
    c3: Chain3;
}

contract LongChain {
    val: Chain4;

    init() {
        self.val = Chain4{
            c3: Chain3{
                c2: Chain2{
                    c1: Chain1{
                        foo: 10
                    }
                }
            }
        };
    }
}