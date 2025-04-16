contract OnlyStrings {
    a: String;
    b: String?;

    init() {
        self.a = "nonopt";
        self.b = null;
    }
}