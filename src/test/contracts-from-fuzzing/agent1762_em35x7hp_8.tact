struct A {
    x: Int as int64;
}

struct B {
    a: A;
    y: Int as uint8;
}

struct C {
    b: B;
    z: Bool;
}

contract MultiSerialization {
    data: C;

    init() {
        self.data = C{
            b: B{
                a: A{
                    x: 12345,
                },
                y: 200,
            },
            z: true,
        };
    }
}