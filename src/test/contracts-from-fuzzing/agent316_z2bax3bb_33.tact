struct Inner {
    x: Int as uint64;
    y: Int? as uint8;
}

struct Outer {
    a: Int? as uint16;
    b: Int as int64;
    in: Inner;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            a: null,
            b: 123,
            in: Inner{
                x: 777,
                y: null
            }
        };
    }
}
