struct StringStruct {
    text: String;
    number: Int;
}

contract StringsInState {
    s: StringStruct;

    init() {
        self.s = StringStruct{
            text: "hello",
            number: 55,
        };
    }
}