contract TestLargePermutation {
    a: Int;
    b: Bool = true;
    c: String = "hello";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Address;
    h: Address? = null;
    i: Cell;
    j: Cell? = null;
    k: Slice;
    l: Slice? = null;
    m: Builder;
    n: Builder? = null;

    init() {
        self.a = 1;
        self.g = myAddress();
        self.i = emptyCell();
        self.k = emptyCell().asSlice();
        self.m = beginCell();
    }
}