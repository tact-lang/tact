struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Int;
    y: Inner?;
    z: Bool;
    w: Int?;
}

contract Test {
    state: Outer;

    init() {
        self.state = Outer{
            x: 7,
            y: Inner{ a: 3, b: null },
            z: true,
            w: null
        };
    }
}