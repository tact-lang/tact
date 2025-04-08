contract OptionalComplexAssign {
    x: Int?;

    init() {
        self.x = null;
        self.x = 5;
        self.x = null;
        self.x = -3;
        self.x = 1000;
    }
}