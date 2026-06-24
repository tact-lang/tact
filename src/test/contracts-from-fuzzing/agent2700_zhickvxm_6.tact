struct Defaulted {
    name: String = "Default";
    age: Int?; // default null
}

contract OptionalDefaults {
    info: Defaulted;

    init() {
        self.info = Defaulted{};
    }
}