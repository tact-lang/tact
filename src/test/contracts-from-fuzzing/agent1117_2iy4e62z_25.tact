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
    flag: Bool;
}

contract ChainDeep {
    data: Chain1;

    init() {
        self.data = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{flag: true}
                }
            }
        };
    }
}
