contract NestedOptionDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;

    init() {
        self.a = 12;
        self.b = null;
        self.c = true;
    }
}