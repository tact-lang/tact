struct DefaultsNested {
    n: Int = 100;
    flag: Bool = true;
}

contract PersistenceDefaults {
    d: DefaultsNested;

    init() {
        self.d = DefaultsNested{};
    }
}