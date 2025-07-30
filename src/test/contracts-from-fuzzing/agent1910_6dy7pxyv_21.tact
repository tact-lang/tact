contract StringDefaults {
    f1: String = "hello";
    f2: String = "";
    f3: String;

    init() {
        self.f3 = "world";
    }
}
