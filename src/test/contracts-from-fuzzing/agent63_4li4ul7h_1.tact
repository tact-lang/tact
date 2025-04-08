struct Inner {
    flag: Bool;
    text: String;
}

contract NestedStructField {
    data: Inner;

    init() {
        self.data = Inner { flag: true, text: "hi" };
    }
}
