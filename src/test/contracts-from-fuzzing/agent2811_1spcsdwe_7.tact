struct Chain4 {
    a: Int;
}

struct Chain3 {
    child: Chain4;
}

struct Chain2 {
    child: Chain3;
}

struct Chain1 {
    child: Chain2;
}

contract ChainNested {
    chain: Chain1;

    init() {
        self.chain = Chain1{
            child: Chain2{
                child: Chain3{
                    child: Chain4{
                        a: 7
                    }
                }
            }
        };
    }
}