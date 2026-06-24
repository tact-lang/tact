struct MultiNested {
    a: StructA;
}

struct StructA {
    b: StructB;
}

struct StructB {
    c: StructC;
}

struct StructC {
    d: StructD;
}

struct StructD {
    e: StructE;
}

struct StructE {
    x: Int;
}

contract MultiNestedContract {
    data: MultiNested;

    init() {
        self.data = MultiNested{
            a: StructA{
                b: StructB{
                    c: StructC{
                        d: StructD{
                            e: StructE{
                                x: 144
                            }
                        }
                    }
                }
            }
        };
    }
}