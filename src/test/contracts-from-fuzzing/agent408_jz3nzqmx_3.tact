struct Outer {
    a: Int;
    b: Bool;
    c: Inner;
}

struct Inner {
    z: Int?;
    w: Bool;
}

contract DeepNest {
    field: Outer;

    init() {
        self.field = Outer{
            a: 1,
            b: false,
            c: Inner{ z: null, w: true }
        };
    }
}