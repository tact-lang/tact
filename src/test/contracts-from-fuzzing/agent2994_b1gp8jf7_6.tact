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
    e: Int;
}

contract DeepNest {
    root: DeepA;

    init() {
        self.root = DeepA{
            b: DeepB{
                c: DeepC{
                    d: DeepD{
                        e: 777,
                    },
                },
            },
        };
    }
}