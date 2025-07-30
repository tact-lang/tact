contract PartialDefaults {
    x: Int;
    y: Bool = true;

    init() {
        self.x = 42;
    }
}