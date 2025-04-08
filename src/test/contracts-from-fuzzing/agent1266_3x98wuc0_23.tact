contract OnlyStrings {
    a: String = "one";
    b: String = "two";
    c: String = "three";

    init() {
        self.a = "A";
        self.b = "B";
        self.c = "C";
    }
}