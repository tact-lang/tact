struct A {
    x: Int;
}

struct B {
    a: A;
    y: Bool;
}

struct C {
    b: B;
    z: String;
}

contract DeepNest {
    val: C;

    init() {
        self.val = C{
            b: B{
                a: A{x: 1},
                y: true
            },
            z: "deep"
        };
    }
}
