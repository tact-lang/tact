struct DeepA {
    valA: Int;
}

struct DeepB {
    valB: DeepA;
}

struct DeepC {
    valC: DeepB;
}

struct DeepD {
    valD: DeepC;
}

contract VeryDeepNested {
    deep: DeepD;

    init() {
        self.deep = DeepD{
            valD: DeepC{
                valC: DeepB{
                    valB: DeepA{
                        valA: 123
                    }
                }
            }
        };
    }
}