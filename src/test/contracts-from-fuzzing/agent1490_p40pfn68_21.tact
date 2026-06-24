struct Chain3 {
    c: Int;
}

struct Chain2 {
    c3: Chain3;
}

struct Chain1 {
    c2: Chain2;
}

struct Root {
    c1: Chain1;
}

contract LayeredStructs {
    r: Root;

    init() {
        self.r = Root{
            c1: Chain1{
                c2: Chain2{
                    c3: Chain3{ c:7 }
                }
            }
        };
    }
}