struct OnlyDefaults {
    x: Int = 5;
    y: String = "hi";
}

contract ContractWithDefaultedStruct {
    data: OnlyDefaults;

    init() {
        self.data = OnlyDefaults{};
    }
}