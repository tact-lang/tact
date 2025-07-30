struct D {
    val: Int;
}

struct C {
    d: D;
}

struct B {
    c: C;
}

struct A {
    b: B;
}

contract TestContract {
    nested: A;

    init() {
        self.nested = A{
            b: B{
                c: C{
                    d: D{
                        val: 42
                    }
                }
            }
        };
    }
}