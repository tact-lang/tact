struct HasStr {
    text: String;
    num: Int;
}

contract StringInStructField {
    data: HasStr;

    init() {
        self.data = HasStr{text: "hello", num: 3};
    }
}
