struct HasString {
    s: String;
}

contract StringFieldTest {
    val: HasString;

    init() {
        self.val = HasString{ s: "test string" };
    }
}