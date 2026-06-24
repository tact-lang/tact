struct A { x: Int; }
struct B { y: Int; }

struct C {
    a: A;
    b: B;
    maybeB: B?;
}

contract StructInsideOptional {
    combined: C;

    init() {
        self.combined = C{
            a: A{x:1},
            b: B{y:2},
            maybeB: null
        };
    }
}