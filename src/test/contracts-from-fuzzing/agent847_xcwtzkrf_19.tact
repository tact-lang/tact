contract InitBeforeDefault {
    x: Int = 5;
    y: Int;

    init() {
        self.y = 10;
    }
}