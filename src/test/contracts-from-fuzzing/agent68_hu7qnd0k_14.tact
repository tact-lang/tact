struct SerializationMix {
    a: Int as int64;
    b: Int;
    c: Int as uint32;
}

contract MixedSerial {
    s: SerializationMix;

    init() {
        self.s = SerializationMix{
            a: -50000,
            b: 340282366920938463463374607431768211455,
            c: 4294967295
        };
    }
}
