struct HasDefaults {
    a: Int = 4;
    b: Bool = true;
    c: String = "string";
}

contract TestContract {
    def: HasDefaults;

    init() {
        self.def = HasDefaults{};
    }
}