struct A {
    i: Int;
}

struct B {
    j: Int;
    a: A;
}

struct C {
    k: Int;
    b: B;
}

contract TestContract {
    c: C;

    init() {
        self.c = C{
            k: 100,
            b: B{
                j: 200,
                a: A{
                    i: 300,
                },
            },
        };
    }
}