contract ReorderFields {
    a: Int as uint8;
    b: Bool;
    c: Int = 5;
    d: String;

    init() {
        self.a = 1;
        self.b = true;
        self.d = "test";
    }
}
