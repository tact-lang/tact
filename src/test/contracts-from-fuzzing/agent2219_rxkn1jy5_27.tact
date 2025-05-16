struct AllPrimitives {
    i: Int;
    b: Bool;
    addr: Address;
    c: Cell;
    s: Slice;
    str: String;
}

contract PrimitivesStore {
    f: AllPrimitives;

    init() {
        self.f = AllPrimitives{
            i: 9,
            b: true,
            addr: myAddress(),
            c: emptyCell(),
            s: emptyCell().asSlice(),
            str: "string"
        };
    }
}