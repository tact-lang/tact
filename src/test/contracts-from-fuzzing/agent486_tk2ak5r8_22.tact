struct BigMix {
    i: Int = 7;
    b: Bool = true;
    addr: Address;
    s: String = "hi";
    c: Cell;
    sl: Slice;
    bu: Builder;
    ni: Int? = null;
    nb: Bool? = null;
    na: Address? = null;
    ns: String? = null;
    nc: Cell? = null;
    nsl: Slice? = null;
    nbu: Builder? = null;
}

contract TestBigMix {
    data: BigMix;

    init() {
        self.data = BigMix{
            addr: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            bu: beginCell()
        };
    }
}