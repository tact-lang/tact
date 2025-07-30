struct A {
    a: Int;
    b: Bool;
}

struct B {
    x: A;
    y: Int;
}

struct C {
    z: B;
    flag: Bool;
}

contract NestedMultiLayer {
    obj: C;

    init() {
        self.obj = C {
            z: B {
                x: A {a: 42, b: true},
                y: 43
            },
            flag: false
        };
    }
}