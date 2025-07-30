contract StringOptionalFields {
    a: String?;
    b: String?;
    c: String?;
    init() {
        self.a = "hello";
        self.b = null;
        self.c = "";
    }
}
