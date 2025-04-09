struct A {
    one: Int;
    two: String;
}

struct B {
    x: Bool;
    y: A?;
}

struct C {
    z: B;
    t: Int;
}

contract MultiNest {
    cfield: C;

    init() {
        self.cfield = C{
            z: B{
                x: true,
                y: A{one:1, two:"hi"}
            },
            t: 37
        };
    }
}