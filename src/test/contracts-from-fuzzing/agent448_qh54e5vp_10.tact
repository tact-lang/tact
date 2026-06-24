struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "hey";
}

contract DefaultsInStructField {
    data: HasDefaults;

    init() {
        self.data = HasDefaults{};
    }
}