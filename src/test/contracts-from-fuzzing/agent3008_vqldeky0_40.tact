contract OptionalAtStart {
    a: Int?;
    b: Int;
    c: String;
    d: Bool;

    init() {
        self.a = null;
        self.b = 1;
        self.c = "z";
        self.d = true;
    }
}