contract OptionalBeforeRequired {
    opt: Int?;
    req: Int;

    init() {
        self.opt = null;
        self.req = 5;
    }
}