struct GiantDefault {
    huge: Int = 1606938044258990275541962092341162602522202993782792835301376; // 2^200
    val: Int = 5;
}

contract LargeLiteralDefaults {
    s: GiantDefault;

    init() {
        self.s = GiantDefault{};
    }
}
