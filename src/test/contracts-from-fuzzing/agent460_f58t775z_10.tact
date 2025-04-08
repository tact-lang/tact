struct A {
    x: Int;
    y: Int?;
}

struct B {
    a: A;
    b: A?;
}

struct C {
    b: B;
    bOpt: B?;
}

contract OptNestedCombo {
    data: C = C{
        b: B{
            a: A{ x: 1, y: null },
            b: null
        },
        bOpt: null
    };

    init() {
        self.data = C{
            b: B{
                a: A{ x: 2, y: 3 },
                b: A{ x: 4, y: 5 }
            },
            bOpt: B{
                a: A{ x: 6, y: null },
                b: null
            }
        };
    }
}
