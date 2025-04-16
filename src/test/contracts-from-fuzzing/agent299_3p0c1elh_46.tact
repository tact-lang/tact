contract InitDefaultsConflict {
    a: Int = 1;
    b: Bool;
    c: String? = null;

    init() {
        self.b = true;
        self.c = "conflict";
    }
}