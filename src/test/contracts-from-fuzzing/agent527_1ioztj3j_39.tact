struct Chain1 {
    next: Chain2;
}

struct Chain2 {
    next: Chain3;
}

struct Chain3 {
    next: Chain4;
}

struct Chain4 {
    x: Int;
}

contract ChainContract {
    val: Chain1;
    init() {
        self.val = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        x: 7
                    }
                }
            }
        };
    }
}