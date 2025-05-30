contract OptionalPrimitivesTest {
    intF: Int?;
    boolF: Bool?;
    addrF: Address?;
    cellF: Cell?;
    sliceF: Slice?;
    strF: String?;
    init() {
        self.intF = null;
        self.boolF = true;
        self.addrF = null;
        self.cellF = null;
        self.sliceF = null;
        self.strF = "x";
    }
}
