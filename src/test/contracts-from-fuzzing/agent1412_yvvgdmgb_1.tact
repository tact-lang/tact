struct Inner {
    a: Int;
    b: String?;
}

struct Outer {
    x: Bool;
    y: Inner;
    z: Int?;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            x: true,
            y: Inner{ a: 1, b: null },
            z: null,
        };
    }
}