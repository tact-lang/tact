struct OptionAndSerial {
    a: Int as uint8;
    b: Int?;
    c: String?;
    d: Bool?;
}

contract ComboContract {
    data: OptionAndSerial;
    init() {
        self.data = OptionAndSerial{
            a: 255,
            b: null,
            c: null,
            d: true,
        };
    }
}