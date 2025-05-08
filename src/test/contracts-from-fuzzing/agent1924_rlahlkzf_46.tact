struct OptionalsAndDefaults {
    a: Int = 5;
    b: Bool? = null;
    c: String? = null;
    d: Address?;
}

contract TestContract {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{
            d: null
        };
    }
}