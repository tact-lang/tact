struct SerialFormats {
    si: Int as int64;
    ui: Int as uint32;
    co: Int as coins;
}

contract SerializeFormatsTest {
    val: SerialFormats;

    init() {
        self.val = SerialFormats{
            si: -123,
            ui: 12345,
            co: ton("0.01")
        };
    }
}