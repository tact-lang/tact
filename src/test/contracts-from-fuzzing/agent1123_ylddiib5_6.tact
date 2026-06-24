struct StructA {
    a: Int;
}

struct StructB {
    b: StructA;
}

struct StructC {
    c: StructB;
}

contract DeeplyNested {
    field: StructC;

    init() {
        self.field = StructC {
            c: StructB {
                b: StructA {
                    a: 7
                }
            }
        };
    }
}