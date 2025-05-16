contract StringVsIntDefaults {
    a: Int = 1;
    b: String = "abc";

    init() {
        self.a=42;
        self.b="def";
    }
}