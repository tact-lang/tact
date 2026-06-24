contract OptionalDefaults {
    x: Int?;
    y: Bool?;

    init() {
        self.x = null;
        self.y = true;
    }
}