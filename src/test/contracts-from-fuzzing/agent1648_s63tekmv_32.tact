// deeply nested mixed optional in contract field

struct A {
    b: B?;
}

struct B {
    c: C?;
}

struct C {
    d: D?;
}

struct D {
    e: E?;
}

struct E {
    val: Int?;
}

contract TestContract {
    root: A;

    init() {
        self.root = A {
            b: B {
                c: C {
                    d: D {
                        e: null
                    }
                }
            }
        };
    }
}