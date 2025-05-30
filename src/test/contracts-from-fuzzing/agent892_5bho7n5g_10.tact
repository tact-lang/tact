struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: B;
}

contract Chain {
    c: C;

    init() {
        self.c = C {
            z: B {
                y: 123,
                a: A { x: 456 }
            }
        };
    }
}