struct Combo {
    one: Int;
    two: Bool;
    three: Int?;
    four: String;
    five: Address;
    six: Cell;
    seven: Slice;
    eight: Builder;
}

contract ComboStorage {
    dat: Combo;

    init() {
        self.dat = Combo{
            one: 1,
            two: false,
            three: null,
            four: "hello",
            five: myAddress(),
            six: emptyCell(),
            seven: emptyCell().asSlice(),
            eight: beginCell()
        };
    }
}