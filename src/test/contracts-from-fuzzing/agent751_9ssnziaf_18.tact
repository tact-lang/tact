struct Defaults {
    a: Int = 10;
    b: String = "abc";
    c: Bool = true;
}

contract StructDefaults {
    val: Defaults;

    init() {
        self.val = Defaults{};
    }
}