struct Chain4 {
    next: Chain3?;
    data: Int;
}
struct Chain3 {
    next: Chain2?;
    data: Int;
}
struct Chain2 {
    next: Chain1?;
    data: Int;
}
struct Chain1 {
    data: Int;
}

contract ChainOpt {
    chain: Chain4;

    init() {
        self.chain = Chain4{
            next: Chain3{
                next: Chain2{
                    next: Chain1{
                        data: 10
                    },
                    data: 20
                },
                data: 30
            },
            data: 40
        };
    }
}