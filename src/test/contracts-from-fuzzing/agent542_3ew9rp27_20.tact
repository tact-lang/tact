struct OnlyDefaults {
    val1: Int = 999;
    val2: Bool = false;
}

contract TestContract {
    a: OnlyDefaults;

    init() {
        self.a = OnlyDefaults{};
    }
}