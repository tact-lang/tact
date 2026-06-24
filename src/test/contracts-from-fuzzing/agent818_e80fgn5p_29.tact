contract DefaultAndInit {
    a: Int = 5;
    b: Bool;
    c: String;
    d: Int?;

    init() {
        self.b = true;
        self.c = "test";
        self.d = null;
    }
}