struct Inner {
    a: Int;
    b: Bool?;
    c: String?;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Inner?;
}

contract Test {
    nested: Outer;

    init() {
        self.nested = Outer{
            x: 1,
            y: Inner{
                a: 2,
                b: null,
                c: null,
            },
            z: null,
        };
    }
}