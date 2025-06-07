struct Inner {
    a: Int as uint8;
    b: Bool;
}

struct Outer {
    x: Int as uint32;
    y: Inner;
}

contract SerializedNest {
    data: Outer;

    init() {
        self.data = Outer{
            x: 123456,
            y: Inner{
                a: 255,
                b: true
            }
        };
    }
}
