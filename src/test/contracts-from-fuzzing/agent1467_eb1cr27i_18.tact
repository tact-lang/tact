struct ZeroDefaults {
    number: Int = 0;
    flag: Bool = false;
}

contract DefaultsTest {
    val: ZeroDefaults;
    init() {
        self.val = ZeroDefaults{};
    }
}