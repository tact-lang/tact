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

contract ManyStructNesting {
    field: C;

    init() {
        self.field = C{
            b: B{
                a: A{x: 33},
                y: true,
            },
            z: "hi",
        };
    }
}