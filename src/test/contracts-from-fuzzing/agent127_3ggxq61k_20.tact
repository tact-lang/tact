struct HasString {
    phrase: String;
}

contract StringInStructField {
    data: HasString;
    init() {
        self.data = HasString{ phrase: "Hello" };
    }
}