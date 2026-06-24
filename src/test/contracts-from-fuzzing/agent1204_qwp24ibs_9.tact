// deeply nested optional chain
struct D {
    x: Int;
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

contract DeepOptChain {
    payload: A;

    init() {
        self.payload = A{
            b: B{
                c: C{
                    d: null
                }
            }
        };
    }
}
