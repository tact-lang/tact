struct DeepA {
    val: Int;
}

struct DeepB {
    a: DeepA;
}

struct DeepC {
    b: DeepB;
}

struct DeepD {
    c: DeepC;
}

struct DeepE {
    d: DeepD;
}

contract VeryDeepNesting {
    root: DeepE;

    init() {
        self.root = DeepE{
            d: DeepD{
                c: DeepC{
                    b: DeepB{
                        a: DeepA{ val: 123 }
                    }
                }
            }
        };
    }
}