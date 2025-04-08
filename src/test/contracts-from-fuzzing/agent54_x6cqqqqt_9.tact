struct IntSerialization {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
}

contract TestContract {
    data: IntSerialization;

    init() {
        self.data = IntSerialization{
            a: 1, b: 2, c: 3, d: 4, e: 5, f: 6
        };
    }
}