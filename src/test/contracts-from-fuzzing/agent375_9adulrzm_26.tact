struct OptionalsWithDefaults {
    one: Int?;
    two: Bool? = false;
    three: String? = "hi";
}

contract TestContract {
    data: OptionalsWithDefaults;

    init() {
        self.data = OptionalsWithDefaults{
            one: null,
            two: null,
            three: null
        };
    }
}
