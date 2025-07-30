struct Chain3 {
    next: Chain2;
    val: Int;
}

struct Chain2 {
    next: Chain1;
    val: Int;
}

struct Chain1 {
    val: Int;
}

contract ChainContract {
    chain: Chain3;

    init() {
        self.chain = Chain3{
            next: Chain2{
                next: Chain1{ val: 1 },
                val: 2
            },
            val: 3
        };
    }
}