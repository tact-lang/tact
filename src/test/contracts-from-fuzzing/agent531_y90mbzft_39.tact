contract EmptyStringDefaults {
    a: String = "";
    b: String = "start";

    init() {
        self.a = "hello";
    }
}