struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: String;
    b: B;
}

contract DeepChain {
    nested: C;

    init() {
        self.nested = C {
            z: "str",
            b: B {
                y: 10,
                a: A { x: 5 }
            }
        };
    }
}
