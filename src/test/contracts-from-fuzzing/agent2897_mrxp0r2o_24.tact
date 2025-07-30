contract DefaultValueConflict {
    x: Int = 10;
    init() {
        self.x = 20;
    }
}