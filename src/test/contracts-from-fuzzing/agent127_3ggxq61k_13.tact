contract OptionalAfterRequired {
    req: Int;
    opt: Int?;

    init() {
        self.req = 5;
        self.opt = null;
    }
}