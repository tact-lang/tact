struct Mix {
    n: Int;
    s: String;
    b: Bool;
    adr: Address;
    c: Cell;
    sl: Slice;
}

contract TestMix {
    data: Mix;
    init() {
        self.data = Mix{
            n: 1,
            s: "hi",
            b: true,
            adr: myAddress(),
            c: emptyCell(),
            sl: emptyCell().asSlice(),
        };
    }
}
