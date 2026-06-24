contract OverwriteOpts {
    opt: Int?;

    init() {
        self.opt = 10;
        self.opt = null;
        self.opt = 20;
    }
}