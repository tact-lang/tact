struct A {
    v: Int;
}

struct B {
    a: A;
    ok: Bool;
}

struct C {
    b: B;
    name: String;
}

contract Test {
    c: C;

    init() {
        self.c = C{
            b: B{
                a: A{ v: 9 },
                ok: true,
            },
            name: "xyz",
        };
    }

    receive() {}
}