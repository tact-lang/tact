contract AllFields {
    intF: Int = 10;
    boolF: Bool = true;
    addrF: Address? = null;
    cellF: Cell? = null;
    sliceF: Slice? = null;
    strF: String? = null;

    init() {
        self.addrF = null;
        self.cellF = null;
        self.sliceF = null;
        self.strF = null;
    }
}