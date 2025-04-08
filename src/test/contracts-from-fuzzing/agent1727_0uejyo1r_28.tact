contract WeirdDefaults {
    x: Int;
    y: Bool = false;
    z: String = "yo";

    init() {
        self.x = 42;
    }
}
