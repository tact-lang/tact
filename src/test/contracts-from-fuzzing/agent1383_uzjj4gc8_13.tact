contract InlineDefault {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";

    init() {
        self.a = 42;
        self.b = false;
        self.c = "bye";
    }
}