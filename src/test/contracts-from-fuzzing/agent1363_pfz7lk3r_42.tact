struct JustString {
    s: String;
}

contract StringAsField {
    val: JustString;

    init() {
        self.val = JustString{s: "hello world"};
    }
}