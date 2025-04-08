struct HasString {
    text: String;
}

contract StringAsStorage {
    field: HasString;

    init() {
        self.field = HasString{
            text: "hello"
        };
    }
}