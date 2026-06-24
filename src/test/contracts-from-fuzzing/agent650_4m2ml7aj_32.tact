contract ComplexFields {
    a: Int = 1;
    b: Int;
    c: Bool = true;
    d: Bool;
    e: String;

    init() {
        self.b = 2;
        self.d = false;
        self.e = "hello";
    }
}
