contract ConflictingDefault {
    a: Int = 5;

    init() {
        self.a = 7;
    }
}
