struct DeepA {
    val: Int;
}

struct DeepB {
    next: DeepA;
}

struct DeepC {
    next: DeepB;
}

struct DeepD {
    next: DeepC;
}

contract VeryDeepNest {
    data: DeepD;
    init() {
        self.data = DeepD{
            next: DeepC{
                next: DeepB{
                    next: DeepA{
                        val: 99
                    }
                }
            }
        };
    }
}