struct OptionalsDefaults {
    oi: Int?;
    ob: Bool?;
    os: String?;
}

contract OptionalsDefaultsTest {
    data: OptionalsDefaults;

    init() {
        self.data = OptionalsDefaults{};
    }
}
