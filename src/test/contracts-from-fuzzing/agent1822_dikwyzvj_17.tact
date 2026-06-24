struct Chain1 {
    next: Chain2;
}

struct Chain2 {
    opt: Chain3?;
}

struct Chain3 {
    val: Int;
}

contract ChainContract {
    data: Chain1;

    init() {
        self.data = Chain1{
            next: Chain2{
                opt: null,
            },
        };
    }
}