struct DeepA {
    f: Int;
}
struct DeepB {
    f: DeepA;
}
struct DeepC {
    f: DeepB;
}
struct DeepD {
    f: DeepC;
}
struct DeepE {
    f: DeepD;
}

contract FiveDeep {
    f: DeepE;
    init() {
        self.f = DeepE{
            f: DeepD{
                f: DeepC{
                    f: DeepB{
                        f: DeepA{f: 123}
                    }
                }
            }
        };
    }
}