struct DeepA {
    b: DeepB;
}

struct DeepB {
    c: DeepC;
}

struct DeepC {
    d: DeepD;
}

struct DeepD {
    e: DeepE;
}

struct DeepE {
    val1: Int;
    val2: Bool;
    val3: Int?;
}

contract SuperDeep {
    root: DeepA;

    init() {
        self.root = DeepA{
            b: DeepB{
                c: DeepC{
                    d: DeepD{
                        e: DeepE{
                            val1: 1, val2: false, val3: null
                        }
                    }
                }
            }
        };
    }
}