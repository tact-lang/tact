struct A {
    a: Int = 1;
}

struct B {
    b: A;
}

struct C {
    c: B;
}

contract TestContract {
    root: C;

    init() {
        self.root = C{
            c: B{
                b: A{
                    a: 99,
                },
            },
        };
    }
}