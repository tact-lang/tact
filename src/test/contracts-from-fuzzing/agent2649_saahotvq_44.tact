struct SerialOpts {
    a: Int as uint8;
    b: Int?;
    c: Bool?;
    d: String?;
}

contract SerialOptsTest {
    val: SerialOpts;

    init() {
        self.val = SerialOpts{
            a: 12,
            b: null,
            c: null,
            d: null,
        };
    }
}