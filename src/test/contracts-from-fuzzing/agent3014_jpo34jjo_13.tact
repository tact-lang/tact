struct DeepA {
    x: Int;
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

contract TestContract {
    val: DeepE;

    init() {
        self.val = DeepE{
            d: DeepD{
                c: DeepC{
                    b: DeepB{
                        a: DeepA{
                            x: 99
                        }
                    }
                }
            }
        };
    }
}