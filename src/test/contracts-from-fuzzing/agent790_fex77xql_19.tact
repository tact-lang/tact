struct HasString {
    text: String;
}

contract StringContract {
    val: HasString;

    init() {
        self.val = HasString{text: "hello"};
    }
}