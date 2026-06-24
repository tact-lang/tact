contract NestedOptionDefault {
    a: Int? = null;
    b: Bool? = false;
    c: String? = null;

    init() {
        self.a = 5;
        self.b = true;
        self.c = "hi";
    }
}