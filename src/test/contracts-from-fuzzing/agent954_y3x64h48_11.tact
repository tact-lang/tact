contract InitAndDefaults {
    a: Int;
    b: Bool = false;
    c: String;

    init() {
        self.a = 123;
        self.c = "abc";
    }
}