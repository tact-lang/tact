struct IntZeroDefaults {
    a: Int = 0;
    b: Int as uint8 = 0;
    c: Int as int16 = 0;
}

contract Test22 {
    val: IntZeroDefaults;

    init() {
        self.val = IntZeroDefaults{};
    }
}