struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Int;
    y: Inner;
    z: String;
}

contract Test {
    field: Outer;
    init() {
        self.field = Outer{
            x: 1,
            y: Inner{ a: 2, b: true },
            z: "hi"
        };
    }
}