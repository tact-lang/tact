contract OptionalStringVsDefault {
    a: String?;
    b: String = "hi";

    init() {
        self.a = null;
    }
}