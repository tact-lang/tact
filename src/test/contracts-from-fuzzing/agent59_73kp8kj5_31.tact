contract LargeOptionalMix {
    a: Int? = null;
    b: Int = 42;
    c: Bool? = null;
    d: Bool = true;
    e: String? = null;
    f: String = "hello";
    g: Cell;

    init() {
        self.g = emptyCell();
    }
}
