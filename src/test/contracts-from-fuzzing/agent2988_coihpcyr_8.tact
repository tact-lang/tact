struct OptionalsAndDefaults {
    testInt: Int? = null;
    testBool: Bool? = null;
    testStr: String? = null;
}

contract OptionDefSwap {
    val: OptionalsAndDefaults;
    init() {
        self.val = OptionalsAndDefaults{};
    }
}