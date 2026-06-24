struct Combo {
    someInt: Int;
    someBool: Bool;
    someAddress: Address;
    someString: String;
    someCell: Cell;
}

contract AllTypes {
    combo: Combo;

    init() {
        self.combo = Combo{
            someInt: 1,
            someBool: true,
            someAddress: myAddress(),
            someString: "test",
            someCell: emptyCell(),
        };
    }
}
