contract LargeIntDefaults {
    a: Int = 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF;

    init() {
        self.a = 42;
    }
}