struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    a: Address;
    sl: Slice;
    bu: Builder;
}

contract ManyFieldTypes {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            i: -1,
            b: true,
            s: "str",
            c: emptyCell(),
            a: myAddress(),
            sl: emptyCell().asSlice(),
            bu: beginCell(),
        };
    }
}