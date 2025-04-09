struct SerializeMix {
    a: Int as int8;
    b: Int as uint8;
    c: Int as int16;
    d: Int as uint16;
    e: Int as int32;
    f: Int as uint32;
    g: Int;
}

contract SerializeMixContract {
    data: SerializeMix;

    init() {
        self.data = SerializeMix{
            a: -10,
            b: 10,
            c: -20,
            d: 20,
            e: -30,
            f: 30,
            g: 40
        };
    }
}