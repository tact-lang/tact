struct A {
    x: Int;
}

struct B {
    a: A;
}

struct C {
    b: B;
}

contract DeepNest {
    val: C;

    init() {
        self.val = C {
            b: B {
                a: A {
                    x: 11,
                },
            },
        };
    }
}