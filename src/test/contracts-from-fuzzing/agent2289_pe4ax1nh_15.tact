contract OnlyImplicitDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "Hello";
    d: Address;
    e: Cell;

    init() {
        self.d = myAddress();
        self.e = emptyCell();
    }
}