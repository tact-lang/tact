contract ShadowingOverrides {
    a: Int = 1;
    b: Int = 2;

    init() {
        self.b = 3;
    }
}