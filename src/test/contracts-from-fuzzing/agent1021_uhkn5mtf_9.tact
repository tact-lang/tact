struct StringDefaults {
    title: String = "default title";
    desc: String = "default desc";
}

contract DefaultsInStruct {
    info: StringDefaults;

    init() {
        self.info = StringDefaults{};
    }
}