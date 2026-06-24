struct Combo {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    c: Cell;
    sl: Slice;
}

contract ComboContract {
    data: Combo;

    init() {
        self.data = Combo{
            i: 1,
            b: true,
            s: "hi",
            a: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice()
        };
    }
}