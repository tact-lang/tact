contract InitOnlyPartial {
    a: Int;
    b: Bool;
    c: String;
    d: Int = 5;
    e: String = "hello";

    init() {
        self.a = 42;
        self.b = true;
        self.c = "world";
    }
}