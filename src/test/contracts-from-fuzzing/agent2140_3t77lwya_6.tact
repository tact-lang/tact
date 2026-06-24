struct ManyTypes {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
}

contract MixedFields {
    data: ManyTypes;
    init() {
        self.data = ManyTypes{
            a: 7,
            b: true,
            c: myAddress(),
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: "test",
        };
    }
}
