struct InnerA {
    x: Int;
}

struct InnerB {
    y: Int?;
}

struct InnerC {
    z: Bool;
}

struct Container {
    a: InnerA;
    b: InnerB;
    c: InnerC;
}

contract MultiNestedStructs {
    data: Container;

    init() {
        self.data = Container{
            a: InnerA{ x: 1 },
            b: InnerB{ y: null },
            c: InnerC{ z: true }
        };
    }
}