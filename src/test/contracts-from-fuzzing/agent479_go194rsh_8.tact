struct A { val: Int; }
struct B { aval: A; }
struct C { bval: B; }
struct D { cval: C; }

contract MixedNested {
    d: D;

    init() {
        self.d = D{
            cval: C{
                bval: B{
                    aval: A{ val: 42 },
                },
            },
        };
    }
}