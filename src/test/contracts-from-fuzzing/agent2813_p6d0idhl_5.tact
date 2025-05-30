struct FieldsWithDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "hello";
}

contract TestDefaults {
    val: FieldsWithDefaults;

    init() {
        self.val = FieldsWithDefaults{};
    }
}
