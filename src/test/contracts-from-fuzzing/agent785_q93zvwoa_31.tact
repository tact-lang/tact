contract OnlyStrings {
    f1: String;
    f2: String?;
    f3: String?;

    init() {
        self.f1 = "hello";
        self.f2 = null;
        self.f3 = null;
    }
}