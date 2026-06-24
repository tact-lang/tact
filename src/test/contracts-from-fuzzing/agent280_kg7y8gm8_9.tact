contract BigPrimitives {
    i: Int = 42;
    b: Bool = true;
    a: Address; // not initialized here
    c: Cell;    // not initialized here
    s: String = "hello";
    init() {
        self.a = context().sender; // assign dynamic at deploy
        self.c = emptyCell();
    }
}