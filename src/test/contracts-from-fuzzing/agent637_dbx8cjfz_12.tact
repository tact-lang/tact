// large struct with mixed serialization lengths
struct SerializeMix {
    a: Int as int8;
    b: Int as uint16;
    c: Int as uint4;
    d: Int; // default 257b
    e: Bool;
    f: Bool?;
}

contract TestContract {
    mixed: SerializeMix;

    init() {
        self.mixed = SerializeMix{
            a: 1,
            b: 255,
            c: 5,
            d: 999,
            e: true,
            f: null
        };
    }
}