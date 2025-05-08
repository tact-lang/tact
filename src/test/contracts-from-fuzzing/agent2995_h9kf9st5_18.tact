struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract ComplexNested {
    data: C;

    init() {
        self.data = C{
            b: B{
                a: A{
                    x: 1,
                    y: 2
                }
            }
        };
    }
}