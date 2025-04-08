contract DefaultAndOptional {
    i1: Int = 5;
    i2: Int?;

    init() {
        self.i2 = null;
    }
}