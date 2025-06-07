contract LazyInitField {
    a: Int;
    b: Bool;
    c: String;
    init() {
        self.a = 5;
        self.b = true;
        self.c = "abc";
    }
}