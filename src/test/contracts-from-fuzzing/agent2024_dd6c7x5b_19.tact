struct HasDefaults {
    a: Int = 5;
    b: Bool = true;
    s: String = "x";
}

contract StructWithDefaults {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}