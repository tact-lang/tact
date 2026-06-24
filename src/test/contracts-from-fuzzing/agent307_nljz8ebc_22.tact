contract OptionalsVsDefaults {
    a: Int = 1;
    b: Int?;
    c: Bool = true;
    d: Bool?;
    s: String = "foo";
    t: String?;

    init() {
        self.b = null;
        self.d = false;
        self.t = null;
    }
}