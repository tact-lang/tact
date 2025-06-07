// Struct with mixed serialization formats, various int bit widths
struct SerialMix {
    s1: Int as uint8;
    s2: Int as int16;
    s3: Int;
    s4: Int as uint32;
    s5: Int as int4;
}

contract TestContract {
    mixed: SerialMix;

    init() {
        self.mixed = SerialMix{
            s1: 1,
            s2: 2,
            s3: 3,
            s4: 4,
            s5: -3,
        };
    }
}