contract BoolEdgeCases {
    f1: Bool;
    f2: Bool?;
    f3: Bool?;

    init() {
        self.f1 = false;
        self.f2 = null;
        self.f3 = true;
    }
}