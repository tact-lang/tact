struct HasEmptyStr {
    s: String;
}

contract EmptyStringField {
    f: HasEmptyStr;
    init() {
        self.f = HasEmptyStr{s: ""};
    }
}