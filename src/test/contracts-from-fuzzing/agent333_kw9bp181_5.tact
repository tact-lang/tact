struct MultipleFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract TestContract {
    data: MultipleFields;

    init() {
        self.data = MultipleFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "abc"
        };
    }
}