contract MutateNullOptional {
    opt: Int?;

    init() {
        self.opt = 5;
        self.opt = null;
        self.opt = 100;
    }
}