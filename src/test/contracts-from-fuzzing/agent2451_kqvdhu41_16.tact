contract StringVariants {
    plain: String;
    opt: String?;

    init() {
        self.plain = "hello";
        self.opt = null;
    }
}