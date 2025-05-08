struct EmptyStringDefault {
    text: String = "";
}

contract StringDefaults {
    s: EmptyStringDefault;

    init() {
        self.s = EmptyStringDefault{text:"hello"};
    }
}