struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    d: D?;
}

struct D {
    x: Int;
    y: Bool;
}

contract ContractDeepNested {
    bigfield: A;

    init() {
        self.bigfield = A{
            b: B{
                c: C{
                    d: null
                }
            }
        };
    }
}