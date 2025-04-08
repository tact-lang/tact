struct HasString {
    s: String;
    b: Bool;
    n: Int;
}

contract StringStructTest {
    val: HasString;

    init() {
        self.val = HasString{ s: "hello", b: true, n: 42 };
    }
}