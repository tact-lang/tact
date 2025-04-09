contract DeepOptional {
    level1: Int?;
    level2: Int?;
    level3: Int?;

    init() {
        self.level1 = null;
        self.level2 = 10;
        self.level3 = null;
    }
}
