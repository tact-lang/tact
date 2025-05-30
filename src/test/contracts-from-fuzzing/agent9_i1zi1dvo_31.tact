struct ZeroDefaults {
    x: Int = 0;
    y: Int = 0;
}

contract NestedZeroDefaults {
    val: ZeroDefaults;
    init() {
        self.val = ZeroDefaults{};
    }
}