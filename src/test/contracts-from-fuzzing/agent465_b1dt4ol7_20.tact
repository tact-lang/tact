// Persistent state contract with very many primitive fields to stress-test limits
contract TestContract {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Bool = false;
    f: Bool = true;
    g: Int = 7;
    h: Int = 8;
    i: Bool = true;
    j: Bool? = null;
    k: Int? = null;
    l: String = "l";
    m: String = "m";
    n: String? = null;
    o: Address;
    p: Cell;
    q: Slice;

    init() {
        self.o = myAddress();
        self.p = emptyCell();
        self.q = emptyCell().asSlice();
    }
}
