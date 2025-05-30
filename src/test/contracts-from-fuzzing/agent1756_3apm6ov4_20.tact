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
    number: Int;
}

contract ChainStorage {
    data: Chain1;

    init() {
        self.data = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        number: 9999
                    }
                }
            }
        };
    }
}
