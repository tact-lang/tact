struct DeepChain {
    x: Int;
}

struct Chain2 {
    c: DeepChain;
}

struct Chain3 {
    cc: Chain2;
}

struct Chain4 {
    ccc: Chain3;
}

contract ChainNestContract {
    val: Chain4;

    init() {
        self.val = Chain4{
            ccc: Chain3{
                cc: Chain2{
                    c: DeepChain{ x: 123 }
                }
            }
        };
    }
}