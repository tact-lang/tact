struct A {
    a: Int;
    b: Bool;
}

struct B {
    a: A;
    s: String;
}

struct C {
    b: B;
    c: Slice;
}

contract DeepStruct {
    field: C = C{
        b: B{
            a: A{ a: 1, b: true },
            s: "nest"
        },
        c: slice("te6cckEBAQEAAgAAAEysuc0=")
    };

    init() {
        self.field = C{
            b: B{
                a: A{ a: 2, b: false },
                s: "deeper"
            },
            c: slice("te6cckEBAQEAAgAAAEysuc0=")
        };
    }
}