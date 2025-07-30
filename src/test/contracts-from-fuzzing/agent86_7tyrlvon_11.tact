struct Tiny {
    a: Int;
}

struct Chain1 {
    t: Tiny;
}

struct Chain2 {
    c1: Chain1;
}

struct Chain3 {
    c2: Chain2;
}

contract ChainTest {
    data: Chain3;
    init() {
        self.data = Chain3{
            c2: Chain2{
                c1: Chain1{
                    t: Tiny{ a: 999 }
                }
            }
        };
    }
}