contract InitDefaults {
    x: Int = 3;
    y: Bool?;
    z: String = "q";
    init() {
        self.y = true;
    }
}