contract TestStorage {
    a: Int = 1;
    b: Bool = false;
    f: String = "hello";
    g: Int? = null;
    h: Bool? = null;
    i: Address? = null;
    j: Cell?;
    k: Slice?;
    l: String? = null;

    init() {
        self.j = emptyCell();
        self.k = emptyCell().asSlice();
    }
}