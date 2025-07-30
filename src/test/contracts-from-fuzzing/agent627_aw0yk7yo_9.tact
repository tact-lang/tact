struct Inner {
    x: Int;
    y: Int?;
    z: Bool;
}

struct Outer {
    a: Int;
    b: Inner;
    c: Bool?;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            a: 42,
            b: Inner{ x: 7, y: null, z: true },
            c: null
        };
    }
}