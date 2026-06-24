contract PrimFields {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Cell;

    init() {
        self.f1 = 11;
        self.f2 = true;
        self.f3 = "hello";
        self.f4 = emptyCell();
    }
}