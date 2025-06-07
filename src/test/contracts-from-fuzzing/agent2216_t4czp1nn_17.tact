struct MixedSerialization {
    i1: Int as int16;
    i2: Int as uint32;
    i3: Int;
    b1: Bool;
    s1: String;
}

contract MixedSerializedFields {
    s: MixedSerialization;
    init() {
        self.s = MixedSerialization{
            i1: -100,
            i2: 123456,
            i3: -99999999,
            b1: true,
            s1: "text"
        };
    }
}
