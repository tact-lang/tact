struct A {
    x: Int;
    y: Bool;
}

struct B {
    m: A;
    n: Int;
}

struct C {
    p: B;
    q: Bool;
}

contract TestContract {
    c: C;

    init() {
        self.c = C {
            p: B {
                m: A {
                    x: 1,
                    y: false,
                },
                n: 10,
            },
            q: true,
        };
    }
}