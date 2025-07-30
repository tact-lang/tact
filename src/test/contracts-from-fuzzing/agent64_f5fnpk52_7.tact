struct A {
    x: Int;
}

struct B {
    a: A;
    y: Int;
}

struct C {
    b: B;
    z: Int;
}

contract MultiNestedStruct {
    nested: C;

    init() {
        self.nested = C{
            b: B{
                a: A{
                    x: 1
                },
                y: 2
            },
            z: 3
        };
    }

    receive() {
        self.nested.b.a.x += 1;
        self.nested.b.y += 1;
        self.nested.z += 1;
    }
}