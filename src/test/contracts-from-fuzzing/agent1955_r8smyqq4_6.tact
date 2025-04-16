struct ManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;
    f: Slice;
    g: Builder;
}

contract Diverse {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            a: 7,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: "ok",
            f: emptyCell().asSlice(),
            g: beginCell(),
        };
    }
}
