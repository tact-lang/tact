// deeply nested with multiple optional and fixed fields
struct A {
    x: Int;
    y: Bool;
}

struct B {
    a: A;
    maybeA: A?;
}

struct C {
    b: B;
    maybeB: B?;
}

struct D {
    c: C;
    maybeC: C?;
}

contract TestContract {
    d: D;

    init() {
        self.d = D{
            c: C{
                b: B{
                    a: A{ x:1, y:false },
                    maybeA: null
                },
                maybeB: null
            },
            maybeC: null
        };
    }
}