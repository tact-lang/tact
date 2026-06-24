struct A {
    x: Int?;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

struct D {
    c: C?;
}

contract OptionalChain {
    d: D;

    init() {
        self.d = D{
            c: C{
                b: null
            }
        };
    }
}