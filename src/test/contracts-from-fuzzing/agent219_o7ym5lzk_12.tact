struct OptStringInt {
    si1: String?;
    si2: Int?;
}

contract OptionalStructTop {
    s1: String?;
    s2: OptStringInt?;
    s3: String?;

    init() {
        self.s1 = null;
        self.s2 = OptStringInt{ si1: null, si2: null };
        self.s3 = null;
    }
}