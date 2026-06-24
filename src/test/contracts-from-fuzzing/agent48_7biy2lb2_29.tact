struct Inner {
    a: Int;
    b: Int?;
}

struct Outer {
    x: Int?;
    y: Int;
    z: Inner;
}

contract TestContract {
    field: Outer;

    init() {
        self.field = Outer {
            x: null,
            y: 123,
            z: Inner{ a: 77, b: null }
        };
    }
}