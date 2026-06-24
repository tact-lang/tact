struct A {
    x: Int;
    y: Int;
}

struct B {
    a: A;
    z: Int;
}

struct C {
    b: B;
    w: Int;
}

contract StructInStruct {
    s: C;

    init() {
        self.s = C{
            b: B{
                a: A{ x: 5, y: 6 },
                z: 7
            },
            w: 8
        };
    }
}
