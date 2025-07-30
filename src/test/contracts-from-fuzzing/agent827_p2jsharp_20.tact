struct SerializedFields {
    a: Int as uint32;
    b: Int as int64;
    c: Bool;
    d: Int as uint8;
}

contract SerializedStructTest {
    s: SerializedFields = SerializedFields{
        a: 123,
        b: 456,
        c: true,
        d: 7
    };

    receive() {
        self.s = self.s;
    }
}