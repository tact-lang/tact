struct StringCombo {
    a: String;
    b: String?;
    c: String = "foo";
    d: String? = null;
}

contract StringComboTest {
    val: StringCombo;

    init() {
        self.val = StringCombo{a:"bar"};
    }
}
