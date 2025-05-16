struct DeepA {
    x: Int?;
}

struct DeepB {
    a: DeepA?;
}

struct DeepC {
    b: DeepB?;
}

struct DeepD {
    c: DeepC?;
}

contract MultiLayerOptional {
    s: DeepD;

    init() {
        self.s = DeepD{
            c: DeepC{
                b: DeepB{
                    a: DeepA{
                        x: 7
                    }
                }
            }
        };
    }
}