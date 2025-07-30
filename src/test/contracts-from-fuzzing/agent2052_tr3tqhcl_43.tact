contract OptionalCellAndPrimitive {
    a: Cell?;
    b: Int?;
    c: Bool?;

    init() {
        self.a = null;
        self.b = 10;
        self.c = null;
    }
}