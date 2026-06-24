struct BoolIntCombo {
    flag: Bool;
    num: Int;
}

contract BoolIntComboTest {
    combo: BoolIntCombo;

    init() {
        self.combo = BoolIntCombo{
            flag: true,
            num: 999
        };
    }
}