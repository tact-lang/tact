struct Inner {
    x: Int as uint8;
    y: Bool;
}

struct Outer {
    i: Inner;
    z: Int as int16;
}

contract NestedSerialized {
    s: Outer;

    init() {
        self.s = Outer{
            i: Inner{
                x: 128,
                y: true
            },
            z: -12345
        };
    }
}