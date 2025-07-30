struct SerializeOpts {
    a: Int as uint8;
    b: Int as uint256;
    c: Int as int257;
    d: Bool;
    e: String;
}

contract SerializeFieldsTest {
    s: SerializeOpts;

    init() {
        self.s = SerializeOpts{
            a: 255,
            b: 12345,
            c: -123456789,
            d: true,
            e: "serialized",
        };
    }
}
