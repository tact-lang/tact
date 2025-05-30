struct ManyTypes {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
}

contract VariantFields {
    data: ManyTypes;

    init() {
        self.data = ManyTypes{
            a: 5,
            b: true,
            c: "str",
            d: myAddress(),
            e: emptyCell(),
            f: emptyCell().asSlice(),
            g: beginCell()
        };
    }
}