contract OnlyNulls {
    x: Int?;
    y: Int?;

    init() {
        self.x = null;
        self.y = null;
    }

    receive() {
        if (self.x == null) {
            self.x = 1;
        }
    }
}