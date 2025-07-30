contract EmptyOptVsDefault {
    a: Int?;
    b: String?;
    c: Bool = false;
    d: Int = 0;

    init() {
        self.a = null;
        self.b = null;
    }
}