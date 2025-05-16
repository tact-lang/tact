contract OnlyStrings {
    a: String;
    b: String?;
    c: String;

    init() {
        self.a = "one";
        self.b = null;
        self.c = "three";
    }
}