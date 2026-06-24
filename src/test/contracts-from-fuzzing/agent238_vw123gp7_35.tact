struct ComboSerialize {
    small: Int as uint8;
    big: Int as int256;
    defaulted: Int = 42;
}

contract SerializeCombo {
    f: ComboSerialize;

    init() {
        self.f = ComboSerialize{small: 255, big: -123, defaulted: 42};
    }
}