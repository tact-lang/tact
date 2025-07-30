contract DefaultAndNonDefault {
    a: Int = 42;
    b: Int;

    init() {
        self.b = 7;
    }
}