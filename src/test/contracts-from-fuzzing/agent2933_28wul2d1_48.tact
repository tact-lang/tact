contract PartialDefaults {
    x: Int;
    y: Int = 7;
    z: Bool = false;

    init() {
        self.x = 10;
    }
}