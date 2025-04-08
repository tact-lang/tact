struct Chain1 {
    c2: Chain2;
}
struct Chain2 {
    c3: Chain3;
}
struct Chain3 {
    c4: Chain4;
}
struct Chain4 {
    finalVal: Int;
}

contract DeepChain {
    c1: Chain1;

    init() {
        self.c1 = Chain1{
            c2: Chain2{
                c3: Chain3{
                    c4: Chain4{
                        finalVal: 42
                    }
                }
            }
        };
    }
}
