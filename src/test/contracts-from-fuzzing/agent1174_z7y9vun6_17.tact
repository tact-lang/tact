contract AllFieldsWithInit {
    a: Int;
    b: Bool;
    c: String;
    d: Slice?;

    init() {
        self.a = 11;
        self.b = false;
        self.c = "abc";
        self.d = null;
    }
}