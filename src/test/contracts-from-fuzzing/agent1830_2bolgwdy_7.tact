struct BoolIntCombo {
    flag: Bool;
    num: Int;
}

contract TestContract {
    combo: BoolIntCombo;

    init() {
        self.combo = BoolIntCombo{
            flag: true,
            num: 999
        };
    }
}
