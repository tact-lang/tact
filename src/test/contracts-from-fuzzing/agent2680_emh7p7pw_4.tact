struct HasString {
    text: String;
}

contract OptNested {
    data: HasString?;

    init() {
        self.data = HasString{
            text: "hi"
        };
    }
}