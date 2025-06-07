struct Inner {
    x: Int as int64;
    y: Int as uint8;
}

struct Outer {
    a: Inner;
    b: Int as uint4;
    c: Int;
}

contract TestContract {
    payload: Outer;

    init() {
        self.payload = Outer{
            a: Inner{ x: 123, y: 255 },
            b: 15,
            c: -999
        };
    }
}