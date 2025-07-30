struct HasDefaults {
    a: Int = 5;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultStructField {
    x: HasDefaults;

    init() {
        self.x = HasDefaults{};
    }
}