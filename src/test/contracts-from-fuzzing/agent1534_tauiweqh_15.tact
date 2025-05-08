struct IntSer {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as int32;
    d: Int as uint64;
    e: Int as int128;
}

contract TestContract {
    val: IntSer;

    init() {
        self.val = IntSer{
            a: 255,
            b: 65535,
            c: -1000,
            d: 123456789,
            e: -123456789012345,
        };
    }
}