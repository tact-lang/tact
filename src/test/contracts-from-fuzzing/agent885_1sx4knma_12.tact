struct A {
    i: Int;
    s: String;
}

struct B {
    a: A;
    b: Bool;
}

struct C {
    b: B;
    c: Int?;
}

contract TestContract {
    nested: C;

    init() {
        self.nested = C{
            b: B{
                a: A{
                    i: 42,
                    s: "deep",
                },
                b: true,
            },
            c: null,
        };
    }
}