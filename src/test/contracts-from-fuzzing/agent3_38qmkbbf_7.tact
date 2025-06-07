struct C {
    value: Int;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

struct Complex {
    a: A;
}

contract GetterTestFixed {
    complex: Complex;

    init() {
        self.complex = Complex{
            a: A{
                b: B{
                    c: C{
                        value: 123,
                    },
                },
            },
        };
    }

    get fun getValue(): Int {
        return self.complex.a.b.c.value;
    }

    receive() {
         let val = self.getValue();
    }
}
