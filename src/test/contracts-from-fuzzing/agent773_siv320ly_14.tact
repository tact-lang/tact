struct Chain1 {
    f1: Bool;
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

struct Chain5 {
    c4: Chain4;
}

contract ChainFiveDeep {
    val: Chain5;

    init() {
        self.val = Chain5{
            c4: Chain4{
                c3: Chain3{
                    c2: Chain2{
                        c1: Chain1{
                            f1: true,
                        }
                    }
                }
            }
        };
    }
}