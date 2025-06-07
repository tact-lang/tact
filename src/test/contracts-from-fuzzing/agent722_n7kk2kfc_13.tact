struct ManyDefaults {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
}

contract Defs {
    val: ManyDefaults;

    init() {
        self.val = ManyDefaults{};
    }
}