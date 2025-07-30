struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct Many {
    a: A;
    b: B;
    c: C;
    optA: A?;
    optB: B?;
    optC: C?;
}

contract TestContract {
    field: Many;

    init() {
        self.field = Many{
            a: A{x:1},
            b: B{y:2},
            c: C{z:3},
            optA: null,
            optB: null,
            optC: null
        };
    }
}