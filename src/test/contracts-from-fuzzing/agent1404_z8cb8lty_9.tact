contract StringSerialize {
    s: String;
    opt: String?;

    init() {
        self.s = "Hello";
        self.opt = null;
    }
}
