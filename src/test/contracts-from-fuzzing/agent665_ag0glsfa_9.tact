contract OnlyOptions {
    i: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.i = null;
        self.b = true;
        self.s = null;
    }

    receive() {
        let _ = self.i;
        let _ = self.b;
        let _ = self.s;
    }
}