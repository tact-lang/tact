struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    b: Int;
}

struct C {
    b: B;
    c: Int;
}

contract DeepStructs {
    c: C;

    init() {
        self.c = C{
            b: B{
                a: A{ x: 1, y: 2 },
                b: 3
            },
            c: 4
        };
    }
}