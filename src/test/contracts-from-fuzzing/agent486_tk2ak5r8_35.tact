contract ConflictingInit {
    a: Int = 0;
    b: Int;

    init() {
        self.b = 42;
    }
}