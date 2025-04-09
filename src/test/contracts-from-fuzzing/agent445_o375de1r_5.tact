struct StructA {
    foo: Int;
}

struct StructB {
    bar: Int;
    nested: StructA;
}

struct StructC {
    baz: Int;
    nestedB: StructB;
}

struct StructD {
    qux: Int;
    nestedC: StructC;
}

contract DeepChain {
    data: StructD;

    init() {
        self.data = StructD{
            qux: 1,
            nestedC: StructC{
                baz: 2,
                nestedB: StructB{
                    bar: 3,
                    nested: StructA{
                        foo: 4
                    }
                }
            }
        };
    }
}
