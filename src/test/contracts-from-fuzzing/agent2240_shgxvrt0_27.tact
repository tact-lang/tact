struct BundledPrims {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
}

contract PrimBundleTest {
    field: BundledPrims;

    init() {
        self.field = BundledPrims{
            a: 1,
            b: true,
            c: myAddress(),
            d: "hey",
            e: emptyCell(),
            f: emptyCell().asSlice()
        };
    }
}