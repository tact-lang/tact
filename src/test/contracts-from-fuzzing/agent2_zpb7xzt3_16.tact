struct E {
    val: Int;
}

struct D {
    e: E?;
}

struct C {
    d: D?;
}

struct B {
    c: C?;
}

struct A {
    b: B?;
}

contract TestContract {
    data: A;
    init() {
        self.data = A{
            b: B{
                c: C{
                    d: null
                }
            }
        };
    }
}