struct OptionalsAndDefaults {
    name: String = "default name";
    age: Int?;
    flag: Bool = true;
}

contract DefaultsMix {
    data: OptionalsAndDefaults;

    init() {
        self.data = OptionalsAndDefaults{
            age: null,
        };
    }
}