struct StringCombo {
    a: String;
    b: String?;
    c: String;
}

contract StringsTest {
    item: StringCombo;

    init() {
        self.item = StringCombo{
            a: "hello",
            b: null,
            c: "world"
        };
    }
}
