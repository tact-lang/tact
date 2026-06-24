struct HasDefaults {
    a: Int = 10;
    b: Bool = true;
    s: String = "abc";
}

contract DefaultsInStructField {
    storage: HasDefaults;

    init() {
        self.storage = HasDefaults{}; // omit fields to test defaults
    }
}