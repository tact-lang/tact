struct HasString {
    s: String;
}

contract StringContract {
    val: HasString;

    init() {
        self.val = HasString{ s: "hello world" };
    }
}