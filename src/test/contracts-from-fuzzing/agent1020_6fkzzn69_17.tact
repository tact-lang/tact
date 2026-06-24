contract DefaultsAndOpt {
    x: Int?;
    y: Bool?;
    s: String = "hello";

    init() {
        self.x = null;
        self.y = null;
    }
}
