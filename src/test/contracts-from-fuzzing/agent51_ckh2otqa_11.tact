contract Test {
    a: Int = 1;
    b: Bool = true;
    c: Address;
    d: Cell;
    e: Int? = null;
    f: Address? = null;
    g: map<Int, Int> = emptyMap();
    h: map<Address, Cell> = emptyMap();
    init() {
        self.c = myAddress();
        self.d = emptyCell();
    }
}