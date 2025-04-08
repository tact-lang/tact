contract WithDefaults {
    x: Int = 42;
    y: Bool = true;
    z: String = "default";
    o: Int?;
    init() {
        self.o = null;
    }
}