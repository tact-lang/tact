struct HasDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "hi";
}

contract StructWithDefaultsField {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}