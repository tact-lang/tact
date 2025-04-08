struct C {
    leaf1: Bool?;
    leaf2: Int?;
}

struct B {
    innerC: C?;
    val: Int?;
}

struct A {
    innerB: B?;
    flag: Bool?;
}

contract Test {
    maybe: A?;

    init() {
        self.maybe = A {
            innerB: B {
                innerC: C { leaf1: null, leaf2: 42 },
                val: null
            },
            flag: true
        };
    }
}