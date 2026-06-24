contract StringDefaults {
    a: String = "";
    b: String = "Hello";
    c: String = " ";
    d: String = "world";

    init() {
        self.a = "bye";
        self.b = "Hey";
        self.c = "!";
        self.d = "man";
    }
}