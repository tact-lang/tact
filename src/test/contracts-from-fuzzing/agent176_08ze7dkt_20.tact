contract DefaultOptionalInit {
    s: String?;
    n: Int?;
    b: Bool?;

    init() {
        self.s = null;
        self.n = null;
        self.b = null;
    }
}