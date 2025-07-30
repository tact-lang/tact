struct HasString {
    s: String;
}

contract StringStructTest {
    val: HasString;

    init() {
        self.val = HasString{ s: "Hello, world!" };
    }
}
