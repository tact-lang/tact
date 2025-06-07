contract OppositeDefaults {
    a: Int = 0;
    b: Int = 100;

    init() {
        self.a = 42;
        self.b = -1;
    }
}