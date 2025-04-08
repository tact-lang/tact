struct Prims {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
}

contract AllPrimTypes {
    data: Prims;

    init() {
        self.data = Prims{
            i: 1,
            b: true,
            s: "hi",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}