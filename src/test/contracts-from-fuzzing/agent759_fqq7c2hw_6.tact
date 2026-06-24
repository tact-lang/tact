struct StringFields {
    text1: String;
    text2: String;
    text3: String;
}

contract Stringy {
    myText: StringFields;

    init() {
        self.myText = StringFields{
            text1: "hello",
            text2: "world",
            text3: "!",
        };
    }
}
