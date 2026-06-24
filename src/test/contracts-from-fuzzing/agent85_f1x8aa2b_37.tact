contract IntOptionDefaults {
    x: Int? = null;
    y: Int? = 5;

    init() {
        self.x = null;
        self.y = 7;
    }

    receive() {}
}