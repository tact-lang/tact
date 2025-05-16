struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    addr: Address;
    sl: Slice;
    c: Cell;
    builder: Builder;
    optInt: Int?;
    optStr: String?;
}

contract DiverseFields {
    store: ManyTypes;

    init() {
        self.store = ManyTypes{
            i: 1,
            b: true,
            s: "hi",
            addr: myAddress(),
            sl: emptyCell().asSlice(),
            c: emptyCell(),
            builder: beginCell(),
            optInt: null,
            optStr: "ok",
        };
    }
}