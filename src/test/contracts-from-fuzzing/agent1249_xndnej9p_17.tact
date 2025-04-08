struct DeepA {
    a: Int;
}

struct DeepB {
    b: DeepA;
}

struct DeepC {
    c: DeepB;
}

struct DeepD {
    d: DeepC;
}

struct DeepE {
    e: DeepD;
}

contract VeryDeepNested {
    data: DeepE;

    init() {
        self.data = DeepE{
            e: DeepD{
                d: DeepC{
                    c: DeepB{
                        b: DeepA{ a: 100 }
                    }
                }
            }
        };
    }
}