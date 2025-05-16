struct NestedStructA {
    b: NestedStructB;
}

struct NestedStructB {
    c: NestedStructC;
}

struct NestedStructC {
    d: NestedStructD;
}

struct NestedStructD {
    value: Bool?;
}

contract TestNestedStructs {
    field: NestedStructA;

    init() {
        self.field = NestedStructA{
            b: NestedStructB{
                c: NestedStructC{
                    d: NestedStructD{
                        value: null
                    }
                }
            }
        };
    }
}
