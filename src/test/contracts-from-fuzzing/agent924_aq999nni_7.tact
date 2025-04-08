struct DeepStructA {
    b: DeepStructB;
}

struct DeepStructB {
    c: DeepStructC;
}

struct DeepStructC {
    d: DeepStructD;
}

struct DeepStructD {
    e: Int?;
}

contract FourNestLayers {
    nested: DeepStructA;

    init() {
        self.nested = DeepStructA{
            b: DeepStructB{
                c: DeepStructC{
                    d: DeepStructD{
                        e: null,
                    },
                },
            },
        };
    }
}