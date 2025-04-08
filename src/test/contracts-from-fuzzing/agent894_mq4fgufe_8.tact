struct StringStuff {
    a: String;
    b: String?;
}

contract StringStorage {
    f: StringStuff;

    init() {
        self.f = StringStuff{ a: "abc", b: null };
    }
}