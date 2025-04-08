struct A {
    x: Int;
}
struct B {
    y: Int;
}
struct C {
    a: A;
    b: B;
}

struct D {
    optA: A?;
    optB: B?;
}

contract DiverseNested {
    val1: C;
    val2: D;
    init() {
        self.val1 = C{
            a: A{x:1},
            b: B{y:2}
        };
        self.val2 = D{
            optA: null,
            optB: null
        };
    }
}
