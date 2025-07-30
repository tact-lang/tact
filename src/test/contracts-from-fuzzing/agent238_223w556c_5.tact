struct ManyTypes {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
}

contract MixedFields {
    data: ManyTypes;

    init() {
        self.data = ManyTypes {
            a: 123,
            b: true,
            c: emptyCell(),
            d: emptyCell().asSlice(),
            e: myAddress(),
            f: "hello",
        };
    }
}