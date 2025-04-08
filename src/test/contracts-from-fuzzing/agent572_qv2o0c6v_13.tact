struct HasString {
    label: String;
}

contract StringFieldTest {
    s: HasString;
    init() {
        self.s = HasString { label: "test string" };
    }
}