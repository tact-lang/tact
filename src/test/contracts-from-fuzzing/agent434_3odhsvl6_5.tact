struct A {
    x: Int;
}

struct B {
    y: Int;
    a: A;
}

struct C {
    z: Int;
    b: B;
    aOpt: A?;
}

contract NestedStructs {
    data: C;

    init() {
        self.data = C{
            z: 1,
            b: B{
                y: 2,
                a: A{ x: 3 }
            },
            aOpt: null
        };
    }

    receive() {}
}
