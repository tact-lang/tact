struct HasString {
    text: String;
    num: Int;
}

contract StringStructStorage {
    data: HasString;

    init() {
        self.data = HasString{
            text: "text",
            num: 123
        };
    }
}