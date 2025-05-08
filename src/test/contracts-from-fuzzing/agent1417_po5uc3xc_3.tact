struct ManyFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Int?;
    f: Slice;
    g: Cell;
    h: Builder;
}

contract TestContract {
    state: ManyFields;
    init() {
        self.state = ManyFields{
            a: 1,
            b: true,
            c: myAddress(),
            d: "test",
            e: null,
            f: emptyCell().asSlice(),
            g: emptyCell(),
            h: beginCell()
        };
    }
}