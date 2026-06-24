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
struct DeepG {
    g: DeepF;
}

contract SuperDeep {
    deep: DeepG;

    init() {
        self.deep = DeepG{
            g: DeepF{
                f: DeepE{
                    e: DeepD{
                        d: DeepC{
                            c: DeepB{
                                b: DeepA{ a: 666 }
                            }
                        }
                    }
                }
            }
        };
    }
}