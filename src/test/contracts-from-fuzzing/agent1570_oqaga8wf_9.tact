struct Defaults {
    num: Int = 42;
    flag: Bool = true;
    text: String = "hello";
}

contract WithDefaults {
    data: Defaults;

    init() {
        self.data = Defaults{};
    }
}