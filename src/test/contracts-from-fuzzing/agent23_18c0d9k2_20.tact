struct SerialTest {
    x: Int as int64;
    y: Int as uint32;
    z: Int as coins;
}

contract SerializationFormats {
    s: SerialTest;

    init() {
        self.s = SerialTest{ x:0, y:1, z:2 };
    }
}