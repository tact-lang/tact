struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";
}

contract DefaultStructField {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}
