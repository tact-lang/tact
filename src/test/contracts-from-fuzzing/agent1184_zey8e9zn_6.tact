contract SomeDefaults {
    a: Int = 12;
    b: Bool = false;
    c: Int?;
    d: String = "hello";

    init() {
        self.a = 34;
        self.c = null;
    }
}