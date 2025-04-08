struct A {
    x: Int;
}

struct B {
    y: Int;
    z: A;
}

struct C {
    nested: B;
}

contract MultiLayers {
    data: C;

    init() {
        self.data = C{
            nested: B{
                y: 777,
                z: A{x:123}
            }
        };
    }
}
