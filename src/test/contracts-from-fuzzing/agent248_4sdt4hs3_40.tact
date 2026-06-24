struct ZeroDefaults {
    a: Int = 0;
    b: Int as uint8 = 0;
    c: Int as int16 = 0;
    d: Int as coins = 0;
}

contract TestContract {
    zero: ZeroDefaults;
    init() {
        self.zero = ZeroDefaults{};
    }
}