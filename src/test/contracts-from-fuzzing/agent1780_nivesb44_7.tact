struct HasDefaults {
    a: Int = 7;
    b: Bool = true;
    c: String = "hello";
}

contract StructDefaults {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}