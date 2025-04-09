struct NestedOptCombo {
    plain: Int;
    optInner: Inner?;
}

struct Inner {
    val1: Int;
    val2: Bool;
}

contract ComboTest {
    combo: NestedOptCombo;
    init() {
        self.combo = NestedOptCombo{
            plain: 1,
            optInner: null,
        };
    }
}