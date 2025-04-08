contract ComplexOptionals {
    x1: Int?;
    x2: Bool?;
    x3: String?;
    x4: Cell?;
    x5: Slice?;

    init() {
        self.x1 = null;
        self.x2 = false;
        self.x3 = null;
        self.x4 = emptyCell();
        self.x5 = null;
    }
}
