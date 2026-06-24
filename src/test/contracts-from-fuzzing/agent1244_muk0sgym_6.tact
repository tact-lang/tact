struct A { x: Int; }
struct B { y: Int; }
struct C { z: Bool; }

struct BigOptionalNest {
    a: A?;
    b: B?;
    c: C?;
    extraInt: Int;
}

contract ManyNestedOptionals {
    state: BigOptionalNest;

    init() {
        self.state = BigOptionalNest{
            a: null,
            b: null,
            c: null,
            extraInt: 100,
        };
    }
}
