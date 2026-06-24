struct Chain1 {
    f1: Int;
}

struct Chain2 {
    f2: Chain1;
}

struct Chain3 {
    f3: Chain2;
}

struct Chain4 {
    f4: Chain3;
}

struct Chain5 {
    f5: Chain4;
}

contract ChainFiveNested {
    value: Chain5;

    init() {
        self.value = Chain5{
            f5: Chain4{
                f4: Chain3{
                    f3: Chain2{
                        f2: Chain1{
                            f1: 123
                        }
                    }
                }
            }
        };
    }
}