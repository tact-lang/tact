struct D {
    info: String;
}

struct C {
    dOpt: D?;
}

struct B {
    cOpt: C?;
}

struct A {
    bOpt: B?;
}

contract Test {
    data: A;

    init() {
        self.data = A{
            bOpt: B{
                cOpt: C{
                    dOpt: null
                }
            }
        };
    }
}