struct ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int?;
    h: Bool?;
    i: String;
}

contract ContractManyFields {
    data: ManyPrimitives;
    init() {
        self.data = ManyPrimitives{
            a: 7,
            b: true,
            c: "c",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: false,
            i: "end",
        };
    }
}