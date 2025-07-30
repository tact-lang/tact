contract OptionalVsDefault {
    a: Int?;
    b: Int = 5;
    c: String?;
    d: String = "hello";

    init() {
        self.a = null;
        self.c = null;
    }
}