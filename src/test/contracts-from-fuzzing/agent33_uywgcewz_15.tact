struct A {
    x: Int;
    y: Bool;
}

struct B {
    f: Int;
    a: A;
}

contract NestedMixedTypes {
    b: B;

    init() {
        self.b = B {
            f: 5,
            a: A {
                x: 7,
                y: true
            }
        };
    }
}