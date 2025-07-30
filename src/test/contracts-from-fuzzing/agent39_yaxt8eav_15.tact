struct DeepNestA {
    x: Int;
}

struct DeepNestB {
    a: DeepNestA;
}

struct DeepNestC {
    b: DeepNestB;
}

struct DeepNestD {
    c: DeepNestC;
}

struct DeepNestE {
    d: DeepNestD;
}

contract SuperDeep {
    data: DeepNestE;

    init() {
        self.data = DeepNestE{
            d: DeepNestD{
                c: DeepNestC{
                    b: DeepNestB{
                        a: DeepNestA{ x: 42 },
                    },
                },
            },
        };
    }
}