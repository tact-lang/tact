struct Chain1 {
    x: Int;
}

struct Chain2 {
    c1: Chain1;
}

struct Chain3 {
    c2: Chain2;
}

contract ChainNested {
    deep: Chain3;
    init() {
        self.deep = Chain3{
            c2: Chain2{
                c1: Chain1{
                    x: 123
                }
            }
        };
    }
}