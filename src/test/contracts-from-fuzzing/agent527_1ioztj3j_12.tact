contract InitDefaults {
    n: Int = 50;
    t: String = "text";
    b: Bool = true;
    init() {
        self.n = 51;
        self.t = "another";
        self.b = false;
    }
}