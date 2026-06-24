struct HasAll {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    a: Address;
    o1: Int?;
    o2: String?;
    o3: Address?;
    sb: Builder;
}

contract AllTypesContract {
    field: HasAll;

    init() {
        self.field = HasAll{
            i: 1,
            b: false,
            s: "abc",
            c: emptyCell(),
            sl: emptyCell().asSlice(),
            a: myAddress(),
            o1: null,
            o2: null,
            o3: null,
            sb: beginCell()
        };
    }
}