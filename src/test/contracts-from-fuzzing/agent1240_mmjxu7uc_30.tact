contract MixedNestedWidths {
    d: D;

    init() {
        self.d = D{
            c: C{
                b: B{
                    a: A{
                        x: -5
                    },
                    small: 15
                },
                big: 123456789
            },
            flag: true
        };
    }
}

struct D {
    c: C;
    flag: Bool;
}

struct C {
    b: B;
    big: Int as int64;
}

struct B {
    a: A;
    small: Int as uint4;
}

struct A {
    x: Int as int8;
}
