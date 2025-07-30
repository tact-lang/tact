struct B {
    f1: Int;
    f2: Int;
    f3: Int;
}

struct A {
    x: Int;
    y: Int;
    z: B;
}

contract Test20 {
    data: A;
    init() {
        self.data = A {
            x: 11,
            y: 22,
            z: B { f1: 1, f2: 2, f3:3 },
        };
    }
}