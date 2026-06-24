struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract ABC {
    nested: C;

    init() {
        self.nested = C{
            b: B{
                a: A{
                    x: 100
                }
            }
        };
    }
}