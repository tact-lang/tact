contract DefaultValueOverwrite {
    a: Int = 10;
    b: String = "hi";
    c: Bool = false;

    init() {
        self.a = 20;
        self.b = "bye";
        self.c = true;
    }
}