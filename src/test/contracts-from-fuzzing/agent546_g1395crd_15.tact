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
struct DeepF {
    f: DeepE;
}

contract VeryDeep {
    root: DeepF;

    init() {
        self.root = DeepF{
            f: DeepE{
                e: DeepD{
                    d: DeepC{
                        c: DeepB{
                            b: DeepA{ a: 42 }
                        }
                    }
                }
            }
        };
    }
}
