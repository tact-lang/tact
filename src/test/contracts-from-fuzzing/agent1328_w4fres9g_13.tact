struct HasDefaults {
    x: Int = 1;
    y: Int = 2;
}

contract Defaulted {
    val: HasDefaults;

    init() {
        self.val = HasDefaults{};
    }
}
