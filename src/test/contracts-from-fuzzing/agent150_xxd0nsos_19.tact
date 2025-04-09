struct EmptyStr {
    s: String;
    so: String?;
}

contract StringFields {
    f: EmptyStr;

    init() {
        self.f = EmptyStr{
            s: "hello",
            so: null
        };
    }
}