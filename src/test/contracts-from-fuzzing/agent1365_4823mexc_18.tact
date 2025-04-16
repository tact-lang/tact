contract DefaultString {
    a: String = "hello";
    b: String = "";

    init() {
        self.a = "world";
        self.b = "foo";
    }
}