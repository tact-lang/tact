struct StringStruct {
    s: String;
}

contract StringField {
    val: StringStruct;
    init() {
        self.val = StringStruct{ s: "hello" };
    }
}