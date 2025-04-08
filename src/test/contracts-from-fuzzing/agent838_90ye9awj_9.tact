struct StringFields {
    x: String;
    y: String;
}

contract TestContract {
    s: StringFields;
    init() {
        self.s = StringFields{ x: "hello", y: "world" };
    }
}