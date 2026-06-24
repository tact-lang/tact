struct Inner {
    a: Int;
}

struct Outer {
    x: Inner?;
    y: Int?;
    z: String?;
}

contract OptionalNest {
    bundle: Outer;

    init() {
        self.bundle = Outer{
            x: Inner{ a: 42 },
            y: null,
            z: null
        };
    }
}
