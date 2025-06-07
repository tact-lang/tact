struct Inner {
    a: Int as uint8;
    b: Int? as int16;
}

struct Outer {
    inner: Inner?;
    c: Int as int32;
}

contract NestedSerial {
    data: Outer;

    init() {
        self.data = Outer{
            inner: null,
            c: -42
        };
    }
}

contract Dummy {receive(){}}