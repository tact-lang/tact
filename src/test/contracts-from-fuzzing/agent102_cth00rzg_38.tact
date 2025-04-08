contract NullableAndDefaults {
    x: Int? = null;
    y: Int?;
    z: Int = 5;

    init() {
        self.y = 10;
    }
}