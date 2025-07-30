contract OptionalInit {
    x: Int?;
    y: Bool?;

    init() {
        self.x = null;
        self.y = null;
    }
}