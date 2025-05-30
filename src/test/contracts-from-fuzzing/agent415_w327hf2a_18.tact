struct SerCombo {
    s1: Int as uint8;
    s2: Int as int64;
    s3: Int as uint256;
    s4: Int as coins;
}

contract SerComboField {
    s: SerCombo;

    init() {
        self.s = SerCombo{ s1: 1, s2: -2, s3: 3, s4: 4 };
    }
}