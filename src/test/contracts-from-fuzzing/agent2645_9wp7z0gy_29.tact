contract OptionalAssign {
    opt: Int?;

    init() {
        self.opt = null;
        self.opt = 5;
    }
}
