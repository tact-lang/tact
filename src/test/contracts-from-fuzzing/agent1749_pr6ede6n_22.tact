struct HasDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultStructField {
    s: HasDefaults;
    init() {
        self.s = HasDefaults{};
    }
}