struct StrStruct {
    text: String;
    flag: Bool;
}

contract StringField {
    s: StrStruct;

    init() {
        self.s = StrStruct{text: "hello", flag: true};
    }
}