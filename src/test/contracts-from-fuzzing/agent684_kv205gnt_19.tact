struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct Complex {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    data: Complex;

    init() {
        self.data = Complex {
            a: A { a: 1 },
            b: B { b: 2 },
            c: C { c: 3 }
        };
    }

    receive() {
        dump(self.data.c.c);
    }
}
