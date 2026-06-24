struct StructA {
    a: Int;
}

struct StructB {
    b: StructA;
}

struct StructC {
    c: StructB;
}

struct StructD {
    d: StructC;
}

contract ChainStructs {
    val: StructD;

    init() {
        self.val = StructD{
            d: StructC{
                c: StructB{
                    b: StructA{
                        a: 42,
                    },
                },
            },
        };
    }
}
