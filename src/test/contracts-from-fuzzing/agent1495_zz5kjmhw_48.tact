struct DeepNestA {
    b: DeepNestB;
}

struct DeepNestB {
    c: DeepNestC;
}

struct DeepNestC {
    d: DeepNestD;
}

struct DeepNestD {
    e: DeepNestE;
}

struct DeepNestE {
    val: Int;
}

contract DeepNestFive {
    root: DeepNestA;

    init() {
        self.root = DeepNestA{
            b: DeepNestB{
                c: DeepNestC{
                    d: DeepNestD{
                        e: DeepNestE{
                            val: 313
                        }
                    }
                }
            }
        };
    }
}
