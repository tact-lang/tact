contract ManyTemps {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "hello";
        self.d = emptyCell();
        self.e = self.d.asSlice();
    }
}