struct SerializationFormats {
    tiny: Int as uint8;
    midi: Int as int16;
    biggie: Int as int257;
    coinz: Int as coins;
}

contract SerializationTest {
    data: SerializationFormats;

    init() {
        self.data = SerializationFormats{
            tiny: 255,
            midi: -32768,
            biggie: 123456789,
            coinz: 1000000000
        };
    }
}