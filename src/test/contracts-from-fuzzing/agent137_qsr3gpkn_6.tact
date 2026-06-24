struct PackedPrimitives {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Bool;
}

contract CustomSerializationTest {
    packed: PackedPrimitives;

    init() {
        self.packed = PackedPrimitives{
            a: -4,
            b: 200,
            c: -30000,
            d: 60000,
            e: -2000000000,
            f: 4000000000,
            g: true
        };
    }

    receive() {}
}