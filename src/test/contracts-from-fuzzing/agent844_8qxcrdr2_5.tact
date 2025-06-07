struct BoolIntCombo {
    flag: Bool;
    num: Int;
}

contract MultipleSameStructs {
    first: BoolIntCombo;
    second: BoolIntCombo;

    init() {
        self.first = BoolIntCombo{ flag: true, num: 10 };
        self.second = BoolIntCombo{ flag: false, num: 42 };
    }

    receive() {
        let _ = self.first;
        let _ = self.second;
    }
}
