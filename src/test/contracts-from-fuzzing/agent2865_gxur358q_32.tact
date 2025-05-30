struct OptionBoolInt {
    a: Int?;
    b: Bool?;
}

contract OptBoolIntTest {
    data: OptionBoolInt;

    init() {
        self.data = OptionBoolInt{
            a: null,
            b: false
        };
    }
}