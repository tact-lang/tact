struct Inner {
    a: Int?;
    b: Bool;
}

struct Outer {
    x: Int;
    y: Inner;
    z: Bool?;
}

contract DeepTest {
    param: Outer;

    init() {
        self.param = Outer{
            x: 7,
            y: Inner{ a: null, b: true },
            z: false
        };
    }
}
