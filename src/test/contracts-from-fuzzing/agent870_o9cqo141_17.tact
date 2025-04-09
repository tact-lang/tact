struct HasString {
    foo: String;
    bar: String;
}

contract StringStructField {
    s: HasString;

    init() {
        self.s = HasString{ foo: "hello", bar: "world" };
    }
}