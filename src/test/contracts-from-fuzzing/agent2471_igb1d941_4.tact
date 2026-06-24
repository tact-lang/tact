struct OptionTest {
    a: Int?;
    b: Bool?;
    c: Address?;
}

contract WithOptionals {
    options: OptionTest;

    init() {
        self.options = OptionTest{
            a: 12,
            b: null,
            c: null,
        };
    }
}