struct Chain4 {
    c: Int;
}

struct Chain3 {
    c: Chain4;
}

struct Chain2 {
    c: Chain3;
}

struct Chain1 {
    c: Chain2;
}

contract DeepChain {
    val: Chain1;

    init() {
        self.val = Chain1{
            c: Chain2{
                c: Chain3{
                    c: Chain4{c:42}
                }
            }
        };
    }
}