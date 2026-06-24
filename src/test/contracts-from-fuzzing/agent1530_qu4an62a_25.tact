contract OptionalDefaults2 {
    x: Int? = null;
    y: Bool? = null;

    init() {
        self.x = 77;
        self.y = true;
    }
}