struct A {
    x: Int;
    y: Int;
}

struct B {
    sA: A;
    z: Int;
}

struct C {
    sB: B;
    flag: Bool;
}

contract StructLayers {
    data: C;
    init() {
        self.data = C{
            sB: B{
                sA: A{
                    x: 1,
                    y: 2,
                },
                z: 3,
            },
            flag: true,
        };
    }
}
