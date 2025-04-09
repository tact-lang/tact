struct SerialInts {
    a: Int as uint8;
    b: Int as uint16;
    c: Int as uint32;
    d: Int as uint64;
    e: Int as int8;
    f: Int as int16;
    g: Int as int32;
    h: Int as int64;
}

contract TypedSerialization {
    val: SerialInts;

    init() {
        self.val = SerialInts{
            a:1, b:2, c:3, d:4, e:5, f:6, g:7, h:8
        };
    }
}