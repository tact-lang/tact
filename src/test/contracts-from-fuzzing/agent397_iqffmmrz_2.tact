struct BigFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract TestContract {
    data: BigFields;

    init() {
        self.data = BigFields{
            a: 1,
            b: true,
            c: "X",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}