struct StringStruct {
    s: String;
    flag: Bool;
}

contract StringStructContract {
    stored: StringStruct;

    init() {
        self.stored = StringStruct{ s: "hey", flag: true };
    }
}