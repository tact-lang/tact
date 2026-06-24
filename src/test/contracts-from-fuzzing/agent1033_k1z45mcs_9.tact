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
    next: Chain5;
}

struct Chain5 {
    number: Int;
}

contract ChainDeep {
    value: Chain1;

    init() {
        self.value = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        next: Chain5{ number: 123 }
                    }
                }
            }
        };
    }
}