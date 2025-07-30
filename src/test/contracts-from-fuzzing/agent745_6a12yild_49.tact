contract ConflictingDefaults2 {
    a: Int = 42;
    b: Int;

    init() {
        self.a = 7;
        self.b = 1;
    }
}