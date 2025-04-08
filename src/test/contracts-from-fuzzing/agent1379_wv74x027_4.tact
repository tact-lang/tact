struct InnerDefaults {
    x: Int = 1;
    y: String = "default";
    z: Bool = true;
}

contract DefaultsStorage {
    d: InnerDefaults;

    init() {
        self.d = InnerDefaults{}; // no explicit values, should use defaults
    }
}
