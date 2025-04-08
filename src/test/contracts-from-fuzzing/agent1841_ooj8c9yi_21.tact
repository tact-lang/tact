struct ComposeFields {
    a: Int?;
    b: Bool;
    c: Int as uint32;
    d: String?;
    e: Cell;
    f: Builder;
    g: Slice;
}

contract ComposeStorage {
    state: ComposeFields;

    init() {
        self.state = ComposeFields{
            a: null,
            b: false,
            c: 42,
            d: null,
            e: emptyCell(),
            f: beginCell(),
            g: emptyCell().asSlice()
        };
    }
}
