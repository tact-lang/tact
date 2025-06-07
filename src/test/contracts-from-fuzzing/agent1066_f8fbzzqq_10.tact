struct Primitives {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
}

contract PrimStore {
    p: Primitives;

    init() {
        self.p = Primitives{
            i: 3,
            b: true,
            s: "s",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}