struct Chain3 {
    next: Chain2;
    val3: Int;
}

struct Chain2 {
    next: Chain1;
    val2: Int;
}

struct Chain1 {
    val1: Int;
}

contract ChainContract {
    x: Chain3;

    init() {
        self.x = Chain3{
            next: Chain2{
                next: Chain1{
                    val1: 1
                },
                val2: 2
            },
            val3: 3
        };
    }
}