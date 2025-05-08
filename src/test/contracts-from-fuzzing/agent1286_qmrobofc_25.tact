contract ShadowingDefaults {
    a: Int = 0;
    b: Int;

    init() {
        self.b = 123;
        self.a = 42; 
    }
}