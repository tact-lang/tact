struct Inner {
    x: Int;
    y: Bool?;
}

struct Middle {
    nested: Inner;
    s: String;
}

struct Outer {
    middle: Middle;
    z: Int?;
}

contract DeepStructTest {
    complex: Outer;

    init() {
        self.complex = Outer{
            middle: Middle{ nested: Inner{ x: 1, y: null }, s: "ok" },
            z: null
        };
    }
}