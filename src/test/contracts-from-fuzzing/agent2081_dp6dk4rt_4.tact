contract OptionalsAndDefaults {
    x: Int = 5;
    y: Bool?;
    z: String = "hello";
    w: Int?;
    init() {
        self.y = null;
        self.w = 10;
    }
}