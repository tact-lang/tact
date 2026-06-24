contract InitOrder {
    a: Int = 7;
    b: Bool;
    c: String = "hi";

    init() {
        self.b = true;
        self.c = "overwritten";
        self.a = 42;
    }
}