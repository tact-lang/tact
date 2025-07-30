contract OptionalVsDefaultInit {
    x: Int?;
    y: Int = 42;

    init() {
        self.x = null;
        self.y = 100;
    }
}