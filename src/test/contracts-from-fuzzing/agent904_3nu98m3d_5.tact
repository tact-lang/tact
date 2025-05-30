struct BigManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
}

contract BigMultiType {
    data: BigManyFields;
    init() {
        self.data = BigManyFields{
            a: 1,
            b: true,
            c: "abc",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
        };
    }
}