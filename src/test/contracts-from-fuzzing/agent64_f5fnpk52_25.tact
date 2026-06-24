struct A {
    x: Int;
    y: Bool?;
}

struct B {
    a: A?;
}

struct C {
    b: B?;
}

contract ComplexNestedOptionals {
    c: C?;

    init() {
        self.c = C{
            b: B{
                a: A{
                    x: 5,
                    y: null
                }
            }
        };
    }

    receive() {
        self.c = null;
    }
}