struct SerFormats {
    a: Int as int64;
    b: Int as uint32;
    c: Int? as uint32;
    d: Int? as int64;
}

contract SerializationsTest {
    val: SerFormats;

    init() {
        self.val = SerFormats{
            a: 1234567890,
            b: 1234567890,
            c: null,
            d: null
        };
    }

    receive() {
        let tmp = self.val;
    }
}