struct StringCombo {
    s1: String;
    s2: String?;
}

contract StringFields {
    val: StringCombo;

    init() {
        self.val = StringCombo{
            s1: "abc",
            s2: null
        };
    }
}