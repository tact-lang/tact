contract OptionalStrings {
    a: String?;
    b: String? = null;
    c: String = "hello";

    init() {
        self.a = null;
    }
}