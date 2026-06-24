struct StructA {
    x: Int;
}

struct StructB {
    sa: StructA;
}

struct StructC {
    sb: StructB;
}

struct StructD {
    sc: StructC;
}

contract DeeplyNestedStructs {
    data: StructD;
    init() {
        self.data = StructD{
            sc: StructC{
                sb: StructB{
                    sa: StructA{
                        x: 111
                    }
                }
            }
        };
    }
}
