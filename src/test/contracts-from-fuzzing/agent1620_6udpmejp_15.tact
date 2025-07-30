contract InitDefaultConflict {
    a: Int = 5;
    b: Int = 7;

    init() {
        self.b = 42;
    }
}