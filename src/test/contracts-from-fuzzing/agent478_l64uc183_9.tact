struct IntWidths {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
}

contract SmallInts {
    packed: IntWidths = IntWidths{
        a: 0, b: 0, c: 0, d: 0, e: 0, f: 0
    };
}