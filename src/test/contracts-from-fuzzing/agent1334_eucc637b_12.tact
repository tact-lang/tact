contract FieldReorder {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = emptyCell();
        self.e = self.d.asSlice();
    }
}