struct A {
    f1: Int;
}

struct B {
    f2: Int;
    sa: A;
}

struct C {
    f3: Int;
    sb: B;
}

contract TestContract {
    s: C;

    init() {
        self.s = C{
            f3: 3,
            sb: B{
                f2: 2,
                sa: A{
                    f1: 1
                }
            }
        };
    }
}