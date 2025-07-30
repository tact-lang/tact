struct WithString {
    text: String;
    flag: Bool;
    val: Int;
}

contract StringFieldTest {
    data: WithString;
    init() {
        self.data = WithString{ text: "hi", flag: true, val: 42 };
    }
}
