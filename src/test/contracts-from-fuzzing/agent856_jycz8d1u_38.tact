struct OptionBoolInt {
    b: Bool?;
    n: Int?;
}

contract OptBoolIntTest {
    val: OptionBoolInt;

    init() {
        self.val = OptionBoolInt{ b: null, n: null };
    }
}