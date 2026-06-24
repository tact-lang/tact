struct SerialFormats {
    a: Int as int64;
    b: Int as uint32;
    c: Int as coins;
}

contract Test {
    val: SerialFormats;
    init() {
        self.val = SerialFormats{
            a: 123,
            b: 40000,
            c: ton("1")
        };
    }
}