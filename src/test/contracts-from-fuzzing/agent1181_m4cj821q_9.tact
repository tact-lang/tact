struct A {
    x: Int;
    b: B;
}

struct B {
    y: Int;
    c: C;
}

struct C {
    z: Int;
    opt: Int?;
}

contract TestContract {
    nested: A;

    init() {
        self.nested = A{
            x: 1,
            b: B{
                y: 2,
                c: C {
                    z: 3,
                    opt: null
                }
            }
        };
    }
}