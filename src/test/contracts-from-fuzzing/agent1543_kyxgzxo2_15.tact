struct E {
    val: Int = 7;
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
    a: A;
    init() {
        self.a = A{
            b: B{
                c: C{
                    d: null
                }
            }
        };
    }
}