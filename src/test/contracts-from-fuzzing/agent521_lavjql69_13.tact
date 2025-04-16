// deeply nested with optionals and serializations
struct A {
    b: B;
    c: C?;
}

struct B {
    d: Int as uint8;
    e: Int as int16;
    f: D?;
}

struct C {
    x: Int?;
    y: Bool?;
}

struct D {
    z: Int as uint32;
}

contract ComplexNestedContract {
    storage: A;

    init() {
        self.storage = A{
            b: B{
                d: 5,
                e: -7,
                f: null,
            },
            c: null,
        };
    }
}