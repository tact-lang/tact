struct InnerString {
    text: String;
}

contract StringField {
    s: InnerString;

    init() {
        self.s = InnerString{
            text: "Hi"
        };
    }
}