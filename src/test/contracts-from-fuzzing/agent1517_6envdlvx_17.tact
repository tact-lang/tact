struct SerializeMix {
    a: Int as uint8;
    b: Int as int32;
    c: Int as uint251;
    d: Int; // implicit int257
}

contract MixedSerialization {
    val: SerializeMix;
    init() {
        self.val = SerializeMix{
            a: 5,
            b: -12345,
            c: 123456789,
            d: -1
        };
    }
}