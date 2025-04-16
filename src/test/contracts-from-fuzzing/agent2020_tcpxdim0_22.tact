struct IntBoolCombo {
    a: Int;
    b: Bool;
}

contract ComboListTest {
    combo1: IntBoolCombo;
    combo2: IntBoolCombo;

    init() {
        self.combo1 = IntBoolCombo{a:1,b:true};
        self.combo2 = IntBoolCombo{a:2,b:false};
    }
}
