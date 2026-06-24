struct Combo {
    i: Int?;
    b: Bool;
    s: String?;
    a: Address;
    c: Cell?;
    sl: Slice;
}

contract TestContract {
    combo: Combo;

    init() {
        self.combo = Combo{
            i: 5,
            b: false,
            s: null,
            a: myAddress(),
            c: null,
            sl: emptyCell().asSlice()
        };
    }
}