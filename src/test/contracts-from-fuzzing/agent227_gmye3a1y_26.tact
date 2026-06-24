contract Mix {
    ai: Int;
    bi: Int as int16;
    cb: Bool;
    ds: String?;

    init() {
        self.ai = 123;
        self.bi = -20;
        self.cb = true;
        self.ds = "ok";
    }
}