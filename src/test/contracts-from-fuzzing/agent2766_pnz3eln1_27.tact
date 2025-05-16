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

contract ChainStructsContract {
    data: D;

    init() {
        self.data = D{
            c: C{
                b: B{
                    a: A{
                        val:42
                    }
                }
            }
        };
    }
}