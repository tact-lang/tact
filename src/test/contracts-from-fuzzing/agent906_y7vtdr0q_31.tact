struct Chain3 {
    a: Int;
}

struct Chain2 {
    next: Chain3;
}

struct Chain1 {
    next: Chain2;
}

contract ChainContract {
    payload: Chain1;

    init() {
        self.payload = Chain1{
            next: Chain2{
                next: Chain3{
                    a: 42,
                },
            },
        };
    }
}