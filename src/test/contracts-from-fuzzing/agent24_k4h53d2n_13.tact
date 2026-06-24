contract InitDefaultConflict {
    a: Int = 0;
    b: Bool;

    init() {
        self.a = 5; // overrides default
        self.b = true;
    }
}