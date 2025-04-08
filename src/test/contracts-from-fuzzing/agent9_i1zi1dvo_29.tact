struct Chain3 {
    n: Int;
}

struct Chain2 {
    mid: Chain3;
}

struct Chain1 {
    mid: Chain2;
}

contract ChainNested {
    nested: Chain1;
    init() {
        self.nested = Chain1 {
            mid: Chain2 {
                mid: Chain3 { n: 1 }
            }
        };
    }
}