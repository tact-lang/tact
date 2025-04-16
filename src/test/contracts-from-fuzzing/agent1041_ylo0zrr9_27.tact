struct Chain1 {
    next: Chain2;
}

struct Chain2 {
    next: Chain3;
    val2: Int;
}

struct Chain3 {
    val3: Int;
    opt: String?;
}

contract LinkChains {
    data: Chain1;

    init() {
        self.data = Chain1{
            next: Chain2{
                next: Chain3{
                    val3: 999,
                    opt:null
                },
                val2: 100
            }
        };
    }
}
