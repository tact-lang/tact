struct DeepA {
    val: Int;
    opt: Int?;
}

struct DeepB {
    a1: DeepA;
    a2: DeepA;
}

struct DeepC {
    b1: DeepB;
    b2: DeepB;
}

contract DeepNest {
    data: DeepC;

    init() {
        self.data = DeepC{
            b1: DeepB{
                a1: DeepA{val:1, opt:null},
                a2: DeepA{val:2, opt:7},
            },
            b2: DeepB{
                a1: DeepA{val:3, opt:null},
                a2: DeepA{val:4, opt:null},
            }
        };
    }
}