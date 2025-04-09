struct AllPrims {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract PrimStorage {
    st: AllPrims;

    init() {
        self.st = AllPrims{
            a: 0, b: false, c: "", d: myAddress(), e: emptyCell(), f: emptyCell().asSlice(),
        };
    }
}