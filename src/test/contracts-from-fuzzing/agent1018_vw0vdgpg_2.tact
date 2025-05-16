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

struct D {
    c: C;
    w: Cell;
}

contract WideNested {
    state: D;

    init() {
        self.state = D{
            c: C{
                b: B{
                    a: A{ x: 123 },
                    y: false,
                },
                z: "hello",
            },
            w: emptyCell(),
        };
    }
}
