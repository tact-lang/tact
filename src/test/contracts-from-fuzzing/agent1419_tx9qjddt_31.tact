struct HasString {
    text: String;
}

contract StringFieldContract {
    textHolder: HasString;

    init() {
        self.textHolder = HasString{
            text: "hello world"
        };
    }
}