struct IntSerialization {
    a: Int as uint8;
    b: Int as int16;
    c: Int;
}

contract TestContract {
    ser: IntSerialization = IntSerialization{
        a: 255,
        b: -32768,
        c: 9999999
    };
}