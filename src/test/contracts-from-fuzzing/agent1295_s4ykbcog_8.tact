// Long list of mixed optional and non-optional fields with default values
contract TestContract {
    a: Int = 0;
    b: Bool = false;
    c: String = "hi";
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Builder;
    n: Builder?;

    init() {
        self.g = myAddress();
        self.i = emptyCell();
        self.k = self.i.asSlice();
        self.m = beginCell();
    }
}