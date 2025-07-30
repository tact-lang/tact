struct DefaultMixed {
    val: Int? = null;
    text: String? = "hello";
    flag: Bool?; // no explicit default
}

contract MixedOptionalsDefaults {
    storage: DefaultMixed;

    init() {
        self.storage = DefaultMixed{}; // all omitted, relying on defaults
    }
}