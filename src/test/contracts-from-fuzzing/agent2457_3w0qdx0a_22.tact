contract StringAndOptional {
    s: String;
    opt: String?;

    init() {
        self.s = "test string";
        self.opt = null;
    }
}