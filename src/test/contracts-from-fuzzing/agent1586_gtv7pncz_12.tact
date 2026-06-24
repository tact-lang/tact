struct In1 {
    i1: Int?;
}

struct In2 {
    i2: Int?;
}

struct Outer {
    a: In1?;
    b: In2?;
}

contract OptNestedWide {
    data: Outer;

    init() {
        self.data = Outer {
            a: null,
            b: null
        };
    }
}