contract OptionalStringStruct {
    f: String?;
    g: String;

    init() {
        self.f = "abc";
        self.g = "def";
    }
}