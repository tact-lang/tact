struct SerializeStruct {
    a: Int as uint8;
    b: Int as int16;
    c: Int as coins;
}

contract SerialStructTest {
    data: SerializeStruct;

    init() {
        self.data = SerializeStruct{
            a: 255,
            b: -32768,
            c: ton("0.5")
        };
    }
}