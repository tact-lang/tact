struct Combo {
    a: Int as uint64;
    b: String;
    c: Bool;
    d: Address;
    e: Slice;
    f: Cell;
    g: Builder;
}

contract ComboPersist {
    x: Combo;
    init() {
        self.x = Combo{
            a:42,
            b:"hi",
            c:true,
            d:myAddress(),
            e:emptyCell().asSlice(),
            f:emptyCell(),
            g:beginCell()
        };
    }
}