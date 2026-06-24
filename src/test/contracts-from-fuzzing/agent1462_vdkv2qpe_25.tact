// optional empty (null) assignment to primitive persistent fields
contract AllNulls {
    i: Int?;
    b: Bool?;
    s: String?;
    c: Cell?;
    addr: Address?;

    init() {
        self.i = null;
        self.b = null;
        self.s = null;
        self.c = null;
        self.addr = null;
    }
}