struct Combo {
    i: Int;
    s: String;
    b: Bool;
    a: Address;
    c: Cell;
}

contract VariedFields {
    combo: Combo;
    init() {
        self.combo = Combo{
            i: 7, s: "test", b: true, a: myAddress(), c: emptyCell()
        };
    }
}