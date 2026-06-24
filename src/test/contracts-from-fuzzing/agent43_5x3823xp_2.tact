struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    z: Int;
}

struct C {
    b: B;
    q: Int;
}

contract NestedManyLevels {
    storage: C;

    init() {
        self.storage = C{
            b: B{
                a: A{x:1, y:2},
                z:3
            },
            q:4
        };
    }
}
