struct SerializeMe {
    small: Int as uint4 = 3;
    big: Int as int64 = -15;
    money: Int as coins = ton("1");
}

contract SerialDefaults {
    val: SerializeMe;
    init() {
        self.val = SerializeMe{};
    }
}