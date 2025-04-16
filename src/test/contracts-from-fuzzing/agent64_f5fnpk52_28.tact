struct NestedA {
    a: Int;
}

struct NestedB {
    b: NestedA;
}

struct NestedC {
    c: NestedB;
}

contract NestedStructsChain {
    field: NestedC;

    init() {
        self.field = NestedC{
            c: NestedB{
                b: NestedA{
                    a: 42
                }
            }
        };
    }

    receive() {
        self.field.c.b.a += 1;
    }
}