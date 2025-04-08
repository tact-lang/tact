struct OptionStr {
    text: String?;
}

contract OptionalStringTest {
    store: OptionStr;

    init() {
        self.store = OptionStr{ text: "Hello" };
    }
}