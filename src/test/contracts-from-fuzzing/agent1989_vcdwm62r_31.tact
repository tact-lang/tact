contract InvalidDefaults {
    a: Int;
    b: Int = 10;

    init() {
        self.a = 1;
        // b already has default, leave unset
    }
}
