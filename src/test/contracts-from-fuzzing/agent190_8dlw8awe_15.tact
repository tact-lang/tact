struct WrappedString {
    text: String;
}

contract StringTest {
    s: WrappedString;

    init() {
        self.s = WrappedString{ text: "hello" };
    }
}