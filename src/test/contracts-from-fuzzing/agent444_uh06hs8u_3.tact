struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract ManyFieldContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a: 1,
            b: false,
            c: "abc",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
        };
    }
}