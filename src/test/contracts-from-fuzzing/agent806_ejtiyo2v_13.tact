struct A {
    a: Int;
}

struct B {
    b: Int;
    inner: A;
}

struct C {
    c: Int;
    innerB: B;
}

contract TestContract {
    data: C;
    init() {
        self.data = C{
            c: 3,
            innerB: B{
                b: 2,
                inner: A {
                    a: 1
                }
            }
        };
    }
}