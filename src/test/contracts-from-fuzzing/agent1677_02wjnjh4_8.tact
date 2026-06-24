struct BoolIntCombo {
    flag: Bool;
    count: Int;
}

struct NestedCombo {
    combo: BoolIntCombo;
    num: Int;
    active: Bool;
}

contract TestNestedCombo {
    data: NestedCombo = NestedCombo{
        combo: BoolIntCombo{ flag:true, count:10 },
        num: 5,
        active: false
    };

    init() {
        self.data.combo.count = 100;
        self.data.active = true;
    }
}
