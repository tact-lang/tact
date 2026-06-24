struct CTDefaults {
    a: Int as uint8 = 1;
    b: Int as uint16 = 2;
    c: Int as coins = ton("1");
}

contract Test {
    val: CTDefaults;

    init() {
        self.val = CTDefaults{};
    }
}