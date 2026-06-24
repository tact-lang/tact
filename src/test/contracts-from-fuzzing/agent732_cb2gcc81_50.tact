struct MixedSerial {
    a: Int as uint32;
    b: Int as int8;
    c: Int as uint64;
    d: Int as int16;
}

contract MixedSerialTest {
    val: MixedSerial;
    
    init() {
        self.val = MixedSerial{
            a:123456,
            b:127,
            c:100000000000,
            d:-12345
        };
    }
}