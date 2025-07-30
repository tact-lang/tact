contract MultiOptional {
    oi: Int?;
    os: Slice?;
    ob: Builder?;

    init() {
        self.oi = null;
        self.os = null;
        self.ob = null;
    }
}