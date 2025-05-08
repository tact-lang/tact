// Int field with serialization type, persistent
contract SerializedTest {
    a: Int as uint8;   // serialize as 8 bit unsigned
    b: Int as int16;  // serialize as 16 bit signed

    init() {
        self.a = 255; // max uint8
        self.b = -32768; // min int16
    }
}
