struct Outer {
    s: Inner;
    x: Int;
}

struct Inner {
    y: Int;
    z: Bool;
}

contract Test {
    field: Outer;

    init() {
        self.field = Outer{
            s: Inner{ y: 42, z: false },
            x: 7
        };
    }
}