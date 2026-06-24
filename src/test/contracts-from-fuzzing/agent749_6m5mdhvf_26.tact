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
    e: Bool?;
}

contract NullableDeep {
    data: DeepA;

    init() {
        self.data = DeepA{
            b: DeepB{
                c: DeepC{
                    d: DeepD{
                        e: null
                    }
                }
            }
        };
    }
}