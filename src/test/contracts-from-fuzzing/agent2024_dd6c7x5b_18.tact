contract EmptyDefaults {
    a: Int;
    b: Bool = false;
    s: String = "hi";

    init() {
        self.a = 0;
    }
}