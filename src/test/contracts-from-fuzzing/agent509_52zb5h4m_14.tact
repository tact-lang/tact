contract DefaultOptional {
    opt1: Int?;
    opt2: Bool?;
    val: Int;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.val = 100;
    }
}