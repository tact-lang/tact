struct Chain1 {
    next: Chain2;
    flag: Bool;
}

struct Chain2 {
    next: Chain3;
    number: Int;
}

struct Chain3 {
    next: Chain4;
    flag2: Bool;
}

struct Chain4 {
    finalVal: Int;
}

contract ChainContract {
    data: Chain1;

    init() {
        self.data = Chain1{
            next: Chain2{
                next: Chain3{
                    next: Chain4{
                        finalVal: 999
                    },
                    flag2: true
                },
                number: 10
            },
            flag: false
        };
    }
}