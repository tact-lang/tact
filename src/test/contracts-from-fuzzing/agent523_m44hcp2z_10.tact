struct TextContainer {
    text1: String;
    text2: String?;
    text3: String;
}

contract StringFields {
    s: TextContainer;

    init() {
        self.s = TextContainer{
            text1: "foo",
            text2: null,
            text3: "bar"
        };
    }
}
