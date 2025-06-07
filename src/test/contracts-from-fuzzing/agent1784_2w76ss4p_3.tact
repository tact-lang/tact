struct OptionalsTest {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptFields {
    st: OptionalsTest;

    init() {
        self.st = OptionalsTest{
            a: null,
            b: true,
            c: null,
            d: myAddress()
        };
    }
}