contract NestedOptionalsFlat {
    f1: Int?;
    f2: String?;
    f3: Bool?;
    f4: Int?;

    init() {
        self.f1 = 10;
        self.f2 = null;
        self.f3 = true;
        self.f4 = null;
    }
}