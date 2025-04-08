struct IntsAndBools {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
}

contract IntBoolTest {
    val: IntsAndBools = IntsAndBools{ a: 1, b: false, c: 2, d: true };

    init() {
        self.val = IntsAndBools{ a: 3, b: true, c: 4, d: false };
    }
}
