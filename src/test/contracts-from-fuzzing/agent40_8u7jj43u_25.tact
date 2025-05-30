contract TestOptionalInitOnly {
    x: Int?;
    y: Bool?;

    init() {
        self.x = null;
        self.y = null;
    }

    receive() {
        let a = self.x;
        let b = self.y;
    }
}