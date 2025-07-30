struct A {
    foo: Int;
}

struct B {
    bar: Bool;
    child: A;
}

struct C {
    baz: Bool;
    nested: B;
}

struct D {
    quux: Int;
    nested: C;
}

contract NestedLayers {
    complex: D;

    init() {
        self.complex = D {
            quux: 10,
            nested: C {
                baz: true,
                nested: B {
                    bar: false,
                    child: A {
                        foo: 99
                    }
                }
            }
        };
    }
}