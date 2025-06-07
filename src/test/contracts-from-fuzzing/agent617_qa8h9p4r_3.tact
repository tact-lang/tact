struct Inner {
    a: Int;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool;
}

contract Test {
    data: Outer;
    init() {
        self.data = Outer{
            x: 10,
            y: Inner{ a: 5, b: true },
            z: false
        };
    }
}