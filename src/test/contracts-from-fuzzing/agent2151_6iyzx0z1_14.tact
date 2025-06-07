struct DeepA {
    a1: Int;
    a2: Int?;
}

struct DeepB {
    b1: Int?;
    b2: DeepA;
}

struct DeepC {
    c1: DeepB;
    c2: Int?;
}

contract VeryDeep {
    val: DeepC;

    init() {
        self.val = DeepC{
            c1: DeepB{
                b1: null,
                b2: DeepA{a1:7, a2:null}
            },
            c2: null
        };
    }
}