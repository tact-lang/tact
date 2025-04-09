contract DefaultedFields {
    a: Int = 1;
    b: Bool = false;
    c: String = "abc";

    init() {
        self.a = 42;
        self.b = true;
        self.c = "ok";
    }
}