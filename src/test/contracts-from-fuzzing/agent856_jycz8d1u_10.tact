struct Defaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract PersistentDefaults {
    state: Defaults;

    init() {
        self.state = Defaults{};
    }
}