struct Inner {
    a: Int as uint32;
    b: Int as int16;
    c: Int as int8;
}

struct Outer {
    x: Int as uint64;
    y: Inner;
    z: Int as int256;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            x: 123,
            y: Inner{ a:1, b:2, c:3 },
            z: 456
        };
    }
}