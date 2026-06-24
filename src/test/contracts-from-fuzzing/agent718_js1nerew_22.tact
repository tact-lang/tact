contract NoDefaults {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;

    init() {
        self.f1 = 42;
        self.f2 = false;
        self.f3 = "ok";
        self.f4 = emptyCell();
    }
}