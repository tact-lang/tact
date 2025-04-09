contract Test15 {
    a: Int = 1;
    b: Bool = false;
    c: String = "foo";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Address? = null;
    h: Cell;

    init() {
        self.h = emptyCell();
    }
}
