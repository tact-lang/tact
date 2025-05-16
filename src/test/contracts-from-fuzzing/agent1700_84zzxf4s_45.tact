contract BoolEdgeCases {
    b1: Bool;
    b2: Bool = false;
    b3: Bool?;

    init() {
        self.b1 = true;
        self.b2 = true;
        self.b3 = null;
    }
}
