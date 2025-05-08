contract InitOverridesDefaults {
    a: Int = 5;
    b: Bool? = null;

    init() {
        self.a = 50;
        self.b = true;
    }

    receive() {
        let _ = self.b;
    }
}