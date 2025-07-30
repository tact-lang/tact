struct A {
    val: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

struct D {
    c: C;
}

contract TestContract {
    deep: D;

    init() {
        self.deep = D{
            c: C{
                b: B{
                    a: A{val: 123}
                }
            }
        };
    }
}