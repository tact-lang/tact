struct OptionalStructField {
    val: Int;
    nested: Int?;
}

contract OptionalStructHolder {
    content: OptionalStructField;

    init() {
        self.content = OptionalStructField{ val: 7, nested: null };
    }

    receive() {
        self.content = self.content;
    }
}