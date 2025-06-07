struct DeepA { a: Int; }
struct DeepB { b: DeepA; }
struct DeepC { c: DeepB; }
struct DeepD { d: DeepC; }
struct DeepE { e: DeepD; }
struct DeepF { f: DeepE; }
struct DeepG { g: DeepF; }
struct DeepH { h: DeepG; }
struct DeepI { i: DeepH; }

contract DeepChain {
    x: DeepI;

    init() {
        self.x = DeepI{
            i: DeepH{
                h: DeepG{
                    g: DeepF{
                        f: DeepE{
                            e: DeepD{
                                d: DeepC{
                                    c: DeepB{
                                        b: DeepA{ a:42 }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
