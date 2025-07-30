struct DefaultStr {
    name: String;
}

contract DefaultStringField {
    s: DefaultStr;
    init() {
        self.s = DefaultStr{
            name: ""
        };
    }
}
