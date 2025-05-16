// Highly nested mix optional and required
struct D {
    a: Int;
    b: Bool?;
}

struct C {
    c1: D;
    c2: D?;
}

struct B {
    b1: C;
    b2: C?;
}

struct A {
    a1: B;
    a2: B?;
}

contract DeepNest {
    s: A;

    init() {
        self.s = A{
            a1: B{
                b1: C{
                    c1: D{a:1,b:true},
                    c2: null
                },
                b2: null
            },
            a2: null
        };
    }
}