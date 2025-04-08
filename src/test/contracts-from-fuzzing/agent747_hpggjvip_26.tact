struct A {
    x: Int?;
}

struct B {
    y: A?;
}

struct C {
    z: B?;
}

contract Test {
    val: C;

    init() {
        self.val = C {
            z: B {
                y: A {
                    x: null,
                },
            },
        };
    }
}