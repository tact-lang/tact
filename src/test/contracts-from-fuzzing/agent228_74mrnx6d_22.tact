contract OptInitAssign {
    x: Int?;

    init() {
        self.x = null;
        self.x = 10;
    }
}