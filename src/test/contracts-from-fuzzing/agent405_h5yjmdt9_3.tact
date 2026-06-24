struct Inner {
    a: Int;
    b: Bool?;
}

struct Outer {
    x: Int = 7;
    y: Slice?;
    z: Inner;
}

contract Combo {
    data: Outer = Outer{
        y: null,
        z: Inner{ a: 3, b: true },
    };

    init() {
        self.data = Outer{
            x: 21,
            y: null,
            z: Inner{ a: 4, b: null },
        };
    }
}