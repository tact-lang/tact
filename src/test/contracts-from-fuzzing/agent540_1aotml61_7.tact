struct StringStruct {
    text: String;
    number: Int;
    flag: Bool;
}

contract StringFields {
    content: StringStruct;

    init() {
        self.content = StringStruct{ text: "test", number: 7, flag: true };
    }
}