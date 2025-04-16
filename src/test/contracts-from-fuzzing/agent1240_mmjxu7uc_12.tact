contract DeepWidths {
    s: A;

    init() {
        self.s = A{
            b: B{
                c: C{
                    small: 7,
                    mid: 12345,
                    big: -999999,
                    optVal: null
                }
            }
        };
    }
}

struct A {
    b: B;
}

struct B {
    c: C;
}

struct C {
    small: Int as uint3;
    mid: Int as uint32;
    big: Int as int64;
    optVal: Int?;
}
